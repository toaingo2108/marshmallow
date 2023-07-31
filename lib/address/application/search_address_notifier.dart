import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/address/infrastructure/search_address_repository.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/api_failure.dart';
part 'search_address_notifier.freezed.dart';

@freezed
class SearchAddressState with _$SearchAddressState {
  const SearchAddressState._();

  const factory SearchAddressState.idle() = _Idle;
  const factory SearchAddressState.loading() = _Loading;

  const factory SearchAddressState.success({
    required List<AutocompletePrediction> addresses,
  }) = _Success;
  const factory SearchAddressState.apiFailure(APIFailure failure) = _APIFailure;
}

class SearchAddressNotifier extends StateNotifier<SearchAddressState> {
  SearchAddressNotifier(this._addressRepository)
      : super(const SearchAddressState.idle());

  final SearchAddressRepository _addressRepository;
  void resetState() {
    state = const SearchAddressState.idle();
  }

  Future<void> getAutocompletePlaces(String query) async {
    state = const SearchAddressState.loading();
    final placesOrFailure =
        await _addressRepository.getAutocompletePlaces(query);
    state = placesOrFailure.fold(
      (l) => l.isEmpty
          ? const SearchAddressState.idle()
          : SearchAddressState.success(addresses: l),
      (r) => SearchAddressState.apiFailure(r),
    );
  }

  Future<void> getPlaceLocation(String placeID, WidgetRef ref) async {
    state = const SearchAddressState.loading();
    final locationOrFailure =
        await _addressRepository.getPlaceLocation(placeID);
    locationOrFailure.fold(
      (l) => ref.read(editedAddressProvider.notifier).update(
            (state) => state == null
                ? Address(coordinates: l)
                : state.copyWith(coordinates: l),
          ),
      (r) => SearchAddressState.apiFailure(r),
    );
    state = const SearchAddressState.idle();
  }
}
