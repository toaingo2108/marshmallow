import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlng/latlng.dart';
import 'package:marshmallow/address/domain/address.dart';
part 'address_dto.freezed.dart';

@freezed
class AddressDTO with _$AddressDTO {
  const AddressDTO._();
  const factory AddressDTO({
    String? id,
    String? street,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    double? lat,
    double? long,
    String? complement,
    bool? isHome,
    bool? selected,
    int? index,
  }) = _AddressDTO;

  factory AddressDTO.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return AddressDTO(
      id: data?['id'] as String,
      selected: data?['selected'] as bool,
      street: data?['street'] as String?,
      city: data?['city'] as String?,
      state: data?['state'] as String?,
      country: data?['country'] as String?,
      postalCode: data?['postalCode'] as String?,
      lat: data?['lat'] as double,
      long: data?['long'] as double,
      isHome: data?['isHome'] as bool?,
      complement: data?['complement'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "street": street,
      "city": city,
      "state": state,
      "country": country,
      "postalCode": postalCode,
      "lat": lat,
      "long": long,
      "isHome": isHome,
      "complement": complement,
      'selected': selected,
    };
  }

  Address toDomain() {
    return Address(
      id: id,
      addressLine1: street,
      addressLine2: '$city, $state',
      country: country,
      complement: complement,
      isHome: isHome,
      coordinates: LatLng(lat!, long!),
      selected: selected,
      postalCode: postalCode,
    );
  }
}
