//? Saved Address Widget
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

import 'package:material_symbols_icons/symbols.dart';

class SavedAddress extends ConsumerWidget {
  const SavedAddress({
    super.key,
    required this.onEditTap,
    required this.address,
    required this.selectedAddress,
  });

  final void Function() onEditTap;
  final Address address;

  final Address? selectedAddress;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 4,
              color: AppColors.textColor.withOpacity(0.2),
            )
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: address.addressLine1 != selectedAddress?.addressLine1
                ? Colors.transparent
                : AppColors.primaryColor,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              ref
                  .read(editingAddressNotifierProvider.notifier)
                  .updateSelectedAddress(address, ref);
            },
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  address.isHome == null
                      ? Symbols.pin_drop
                      : address.isHome!
                          ? Symbols.home
                          : Symbols.work,
                  color: AppColors.darkGray,
                ),
                const SizedBox(
                  width: 23,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          address.isHome == null
                              ? 'Other'
                              : address.isHome!
                                  ? 'Home'
                                  : 'Work',
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        if (address.addressLine1 ==
                            selectedAddress?.addressLine1)
                          Container(
                            height: 9,
                            width: 9,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 6,
                              color: AppColors.white,
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${address.addressLine1 ?? ''}\n${address.addressLine2 ?? ''}\n${address.complement ?? ''}',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 9,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(editedAddressProvider.notifier)
                          .update((state) => address);
                      showRoundedBottomModal(
                        context,
                        AddressOverlayOptions(onEditTap: onEditTap),
                      );
                    },
                    child: const SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: Icon(
                          Icons.more_vert,
                          size: 20,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
