//? Textfield for inputting a digit of the verification code.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marshmallow/theme/theme.dart';

class PhoneOTPTextField extends StatelessWidget {
  const PhoneOTPTextField({
    required this.onChanged,
    required this.sentPhone,
  });
  final String? sentPhone;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: sentPhone == null,
      child: Container(
        width: 36,
        height: 48,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.phoneVerificationTextfield,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: TextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            cursorColor: AppColors.textColor,
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              counterText: '',
            ),
            onChanged: (val) {
              onChanged(val);
              if (val.isNotEmpty) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).previousFocus();
              }
            },
            maxLength: 1,
          ),
        ),
      ),
    );
  }
}
