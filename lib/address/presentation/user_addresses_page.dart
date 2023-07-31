import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/address/presentation/widgets/widgets.dart';
import 'package:marshmallow/address/shared/providers.dart';

//? Page that displays a list of the user's saved addresses.
class UserAddressesPage extends ConsumerWidget {
  const UserAddressesPage({
    super.key,
    required this.onEditTap,
    required this.addresses,
  });
  final void Function() onEditTap;
  final List<Address> addresses;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return SavedAddress(
            address: addresses[index],
            onEditTap: onEditTap,
            selectedAddress: ref.watch(addressProvider),
          );
        },
      ),
    );
  }
}
