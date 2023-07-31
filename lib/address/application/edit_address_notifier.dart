import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/address/infrastructure/address_repository.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/permission_failure.dart';

part 'edit_address_notifier.freezed.dart';

@freezed
class EditAddressState with _$EditAddressState {
  const EditAddressState._();

  const factory EditAddressState.loading() = _Loading;
  const factory EditAddressState.idle() = _Idle;
  const factory EditAddressState.success({
    required List<Address> addresses,
  }) = _Success;
  const factory EditAddressState.firebaseFailure(FirebaseFailure failure) =
      _FirebaseFailure;
  const factory EditAddressState.permissionFailure(PermissionFailure failure) =
      _PermissionFailure;
}

class EditAddressNotifier extends StateNotifier<EditAddressState> {
  EditAddressNotifier(this._addressRepository)
      : super(const EditAddressState.loading());

  // ignore: unused_field
  final AddressRepository _addressRepository;

  Future<void> getSelectedAddress(
    WidgetRef ref,
  ) async {
    final userID = ref.read(authNotifierProvider.notifier).getUserID;
    final addressOrFailure =
        await _addressRepository.getSelectedAddress(userID: userID!);

    ref.read(addressProvider.notifier).update(
          (state) => addressOrFailure.fold((l) => l, (r) => null),
        );
  }

  Future<void> deleteAddress(Address address, WidgetRef ref) async {
    final userID = ref.read(authNotifierProvider.notifier).getUserID;
    if (ref.read(addressProvider)?.addressLine1 == address.addressLine1) {
      ref.read(addressProvider.notifier).update((state) => null);
    }
    final unitOrError = await _addressRepository.deleteAddress(
      addressID: address.id!,
      userID: userID!,
    );
    unitOrError.fold(
      (l) {
        fetchAddresses(ref);
      },
      (r) => null,
    );
  }

  Future<void> updateSelectedAddress(Address address, WidgetRef ref) async {
    final userID = ref.read(authNotifierProvider.notifier).getUserID;
    final prevAddress = ref.read(addressProvider);
    ref
        .read(addressProvider.notifier)
        .update((state) => address.copyWith(selected: true));

    if (prevAddress != null) {
      await _addressRepository.updateAddress(
        addressID: prevAddress.id!,
        data: {'selected': false},
        userID: userID!,
      );
    }
    final unitOrFailure = await _addressRepository.updateAddress(
      addressID: address.id!,
      data: {'selected': true},
      userID: userID!,
    );
    unitOrFailure.fold(
      (l) => ref
          .read(addressProvider.notifier)
          .update((state) => address.copyWith(selected: true)),
      (r) => null,
    );
  }

  Future<void> saveAddress(Address address, WidgetRef ref) async {
    final userID = ref.read(authNotifierProvider.notifier).getUserID;
    final numOfAddresses =
        state.maybeMap(orElse: () => 0, success: (_) => _.addresses.length);
    if (numOfAddresses == 0) {
      ref
          .read(addressProvider.notifier)
          .update((state) => address.copyWith(selected: true));
    }
    final completedAddress =
        _addressRepository.prepareForFirestore(address, numOfAddresses);

    final unitOrFailure = await _addressRepository.createAddress(
      address: completedAddress.toDTO(),
      userID: userID!,
    );

    state = unitOrFailure.fold(
      (l) => const EditAddressState.idle(),
      (r) => EditAddressState.firebaseFailure(r),
    );
  }

  Future<bool> getUserCoordinates(WidgetRef ref) async {
    final coordinatesOrFailure = await _addressRepository.getUserCoordinates();

    return coordinatesOrFailure.fold(
      (l) {
        ref.read(editedAddressProvider.notifier).update(
              (state) => state != null
                  ? state.copyWith(coordinates: l)
                  : Address(
                      coordinates: l,
                    ),
            );
        return true;
      },
      (r) {
        state = EditAddressState.permissionFailure(r);
        return false;
      },
    );
  }

  Future<void> getAddressFromCoordinates(
    WidgetRef ref,
    Address address,
  ) async {
    final addressOrFailure =
        await _addressRepository.getAddressFromCoordinates(address.toDTO());

    addressOrFailure.fold(
      (l) => ref.read(editedAddressProvider.notifier).update((state) => l),
      (r) => state = EditAddressState.firebaseFailure(r),
    );
  }

  Future<void> fetchAddresses(WidgetRef ref) async {
    final userID = ref.read(authNotifierProvider.notifier).getUserID;
    state = const EditAddressState.loading();
    final addressesOrFailure =
        await _addressRepository.getAddresses(userID: userID!);

    state = addressesOrFailure.fold(
      (l) => EditAddressState.success(addresses: l),
      (r) => EditAddressState.firebaseFailure(r),
    );
  }
}
