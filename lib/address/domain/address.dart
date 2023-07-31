import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlng/latlng.dart';
import 'package:marshmallow/address/infrastructure/address_dto.dart';
part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const Address._();
  const factory Address({
    String? id,
    String? addressLine1,
    String? addressLine2,
    String? country,
    String? complement,
    String? postalCode,
    bool? isHome,
    required LatLng coordinates,
    bool? selected,
    int? index,
  }) = _Address;

  AddressDTO toDTO() {
    return AddressDTO(
      id: id,
      street: addressLine1,
      city: addressLine2?.split(',').first,
      state: addressLine2?.split(',').last,
      country: country,
      postalCode: postalCode,
      isHome: isHome,
      lat: coordinates.latitude,
      long: coordinates.longitude,
      complement: complement,
      selected: selected,
    );
  }
}
