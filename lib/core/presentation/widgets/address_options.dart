import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/flat_button.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:material_symbols_icons/symbols.dart';

//? The bottom modal for displaying remove or edit options on a saved address
class AddressOverlayOptions extends ConsumerWidget {
  const AddressOverlayOptions({
    super.key,
    required this.onEditTap,
  });

  final void Function() onEditTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editedAddress = ref.read(editedAddressProvider);

    return Container(
      color: Colors.white,
      height: 230,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              editedAddress?.isHome == null || editedAddress!.isHome == null
                  ? 'Other'
                  : editedAddress.isHome!
                      ? 'Home'
                      : 'Work',
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Expanded(
                  child: PillButton(
                    title: 'Remove',
                    fontColor: AppColors.secondaryTextColor,
                    borderColor: AppColors.secondaryTextColor,
                    icon: Symbols.delete,
                    fontSize: 12,
                    onTap: () async {
                      ref
                          .read(editingAddressNotifierProvider.notifier)
                          .deleteAddress(editedAddress!, ref);
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: PillButton(
                    title: 'Edit',
                    fontColor: AppColors.secondaryTextColor,
                    borderColor: AppColors.secondaryTextColor,
                    fontSize: 12,
                    icon: Symbols.edit_note,
                    onTap: onEditTap,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'back to address',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
