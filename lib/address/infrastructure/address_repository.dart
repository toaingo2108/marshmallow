import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/address/infrastructure/address_dto.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/permission_failure.dart';
import 'package:marshmallow/core/shared/api_path.dart';

class AddressRepository {
  final db = FirebaseFirestore.instance.collection('users');

  Address prepareForFirestore(Address address, int numOfAddresses) {
    Address finalAddress = address;
    if (finalAddress.id == null) {
      finalAddress = finalAddress.copyWith(
        id: documentIDFromCurrentDate(),
      );
    }
    if (finalAddress.selected == null) {
      finalAddress = finalAddress.copyWith(selected: numOfAddresses == 0);
    }
    return finalAddress;
  }

  Future<Either<Unit, FirebaseFailure>> createAddress({
    required AddressDTO address,
    required String userID,
  }) async {
    final docRef = db
        .doc(
          APIPath.userAddress(
            userID,
            address.id!,
          ),
        )
        .withConverter(
          fromFirestore: AddressDTO.fromFirestore,
          toFirestore: (AddressDTO address, options) => address.toFirestore(),
        );

    try {
      await docRef.set(address);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
    return left(unit);
  }

  Future<Either<Unit, FirebaseFailure>> updateAddress({
    required String addressID,
    required Map<String, dynamic> data,
    required String userID,
  }) async {
    final docRef = db.doc(APIPath.userAddress(userID, addressID));

    try {
      await docRef.update(data);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
    return left(unit);
  }

  Future<Either<Unit, FirebaseFailure>> deleteAddress({
    required String addressID,
    required String userID,
  }) async {
    final docRef = db.doc(APIPath.userAddress(userID, addressID));

    try {
      await docRef.delete();
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
    return left(unit);
  }

  Future<Either<Address, FirebaseFailure>> getSelectedAddress({
    required String userID,
  }) async {
    final docRef = FirebaseFirestore.instance
        .collection(APIPath.userAddressesCollection(userID))
        .where('selected', isEqualTo: true);

    try {
      final docs = await docRef.get();
      final address =
          AddressDTO.fromFirestore(docs.docs.first, null).toDomain();

      return left(address);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }

  Future<Either<List<Address>, FirebaseFailure>> getAddresses({
    required String userID,
  }) async {
    final docRef = FirebaseFirestore.instance.collection(
      APIPath.userAddressesCollection(userID),
    );

    try {
      final docs = await docRef.get();

      final addresses = docs.docs.map((e) {
        return AddressDTO.fromFirestore(e, null).toDomain();
      }).toList();

      return left(addresses);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }

  Future<Either<LatLng, PermissionFailure>> getUserCoordinates() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return right(const PermissionFailure.denied());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return right(const PermissionFailure.deniedForever());
    }
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return left(LatLng(position.latitude, position.longitude));
  }

  Future<Either<Address, FirebaseFailure>> getAddressFromCoordinates(
    AddressDTO address,
  ) async {
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(address.lat!, address.long!);
      return left(
        address
            .copyWith(
              street: placemarks[0].street,
              city: placemarks[0].locality,
              state: placemarks[0].administrativeArea,
              country: placemarks[0].country,
              postalCode: placemarks[0].postalCode,
            )
            .toDomain(),
      );
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }
}
