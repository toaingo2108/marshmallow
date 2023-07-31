import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marshmallow/theme/app_colors.dart';

class ConfirmedOnLabel extends StatelessWidget {
  const ConfirmedOnLabel({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          const Text(
            'Confirmed ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 8,
              color: AppColors.green,
            ),
          ),
          Text(
            'on ${DateFormat('MM/dd/yyyy').format(date)}',
            style: const TextStyle(
              fontSize: 8,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
