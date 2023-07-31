import 'package:marshmallow/address/application/edit_address_notifier.dart';
import 'package:marshmallow/address/application/search_address_notifier.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/address/infrastructure/address_repository.dart';
import 'package:marshmallow/address/infrastructure/search_address_repository.dart';
import 'package:riverpod/riverpod.dart';

final addressProvider = StateProvider<Address?>((ref) => null);

final addressRepository = Provider(
  (ref) => AddressRepository(),
);

final searchAddressRepository = Provider(
  (ref) => SearchAddressRepository(),
);

final editingAddressNotifierProvider =
    StateNotifierProvider<EditAddressNotifier, EditAddressState>(
  (ref) => EditAddressNotifier(ref.watch(addressRepository)),
);

final searchAddressNotifierProvider =
    StateNotifierProvider<SearchAddressNotifier, SearchAddressState>(
  (ref) => SearchAddressNotifier(
    ref.watch(searchAddressRepository),
  ),
);

final editedAddressProvider = StateProvider<Address?>((ref) => null);
