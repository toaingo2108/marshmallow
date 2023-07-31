import 'package:flutter/material.dart';
import 'package:marshmallow/auth/presentation/widgets/widgets.dart';
import 'package:marshmallow/core/presentation/widgets/container_with_shadow.dart';
import 'package:marshmallow/theme/app_colors.dart';

class CredentialOption extends StatelessWidget {
  const CredentialOption({
    super.key,
    required this.isPhone,
    required this.emailOrPhone,
    required this.confirmationDate,
  });
  final bool isPhone;
  final String emailOrPhone;
  final DateTime confirmationDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isPhone ? 'Phone Number' : 'E-mail',
          style:
              const TextStyle(fontSize: 8, color: AppColors.secondaryTextColor),
        ),
        const SizedBox(
          height: 6,
        ),
        ContainerWithShadow(
          height: 28,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    children: [
                      Text(
                        emailOrPhone,
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
        ),
        ConfirmedOnLabel(date: confirmationDate),
      ],
    );
  }
}
