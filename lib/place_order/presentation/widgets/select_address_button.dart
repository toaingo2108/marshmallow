import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/functions.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

class SelectAddressWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TouchableOpacity(
      onTap: () {
        openUsersAddresses(context, ref);
      },
      activeOpacity: 0.4,
      child: Container(
        height: Utils.sizeOf(80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 4,
              color: AppColors.black.withOpacity(0.15),
            )
          ],
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(Utils.sizeOf(20)),
              child: Icon(
                Symbols.pin_drop,
                color: AppColors.black,
                size: Utils.sizeOf(40),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ref.watch(addressProvider) == null
                        ? 'Please Select an address'
                        : ref.watch(addressProvider)?.isHome == null
                            ? 'Other'
                            : ref.watch(addressProvider)!.isHome!
                                ? 'Home'
                                : 'Work',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: Utils.sizeOf(24),
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (ref.watch(addressProvider)?.addressLine1 != null)
                    Text(
                      ref.watch(addressProvider)!.addressLine1!,
                      style: TextStyle(
                        color: AppColors.darkGray,
                        fontSize: Utils.sizeOf(20),
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(Utils.sizeOf(10)),
              child: const Icon(
                Symbols.navigate_next,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
