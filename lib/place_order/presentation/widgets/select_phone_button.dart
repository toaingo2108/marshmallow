import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/extensions.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

class CallPhoneNumberWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TouchableOpacity(
      activeOpacity: 0.4,
      onTap: () {
        context.router.push(const UserProfileRoute());
      },
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
              margin: EdgeInsets.only(
                left: Utils.sizeOf(30),
                right: Utils.sizeOf(20),
                top: Utils.sizeOf(20),
                bottom: Utils.sizeOf(20),
              ),
              child: SizedBox(
                width: Utils.sizeOf(30),
                height: Utils.sizeOf(30),
                child: ref.read(userInfoProvider)?.phoneNumber != null
                    ? Image.asset(
                        'assets/images/ic_phone.png',
                        fit: BoxFit.fill,
                      )
                    : const Icon(
                        Icons.email,
                        size: 18,
                        color: AppColors.textColor,
                      ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ref.watch(userInfoProvider) == null
                        ? 'Add a phone or email address'
                        : (ref.watch(userInfoProvider)?.phoneNumber != null
                            ? ((ref.watch(userInfoProvider)!.phoneNumber ?? '')
                                .toPhoneNumber()!)
                            : ref.watch(userInfoProvider)!.email ??
                                'email fail'),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: Utils.sizeOf(24),
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
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
