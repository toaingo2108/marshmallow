import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

class AddCredentialContainer extends StatelessWidget {
  const AddCredentialContainer({
    super.key,
    required this.isPhone,
  });

  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return ContainerWithShadow(
      height: 28,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.router.push(
                VerifyPhoneOrEmailRoute(isPhone: isPhone),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  Text(
                    isPhone ? 'Add phone number' : 'Add E-mail address',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textColor,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
