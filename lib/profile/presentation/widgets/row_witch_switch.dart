import 'package:flutter/cupertino.dart';
import 'package:marshmallow/theme/app_colors.dart';

class RowWithSwitch extends StatelessWidget {
  const RowWithSwitch({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final bool value;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: AppColors.textColor, fontSize: 12),
        ),
        const Spacer(),
        SizedBox(
          width: 28,
          height: 15,
          child: Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              value: value,
              activeColor: AppColors.darkPrimaryColor,
              trackColor: AppColors.inactiveSwitchGray,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
