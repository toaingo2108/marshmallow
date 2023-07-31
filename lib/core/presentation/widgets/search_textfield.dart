import 'package:flutter/material.dart';

import 'package:marshmallow/theme/theme.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.hintText,
    this.onChanged,
  });

  final String? hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(1.5, 1.5),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: AppColors.textColor,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.textColor,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.only(top: 10),
          hintStyle: const TextStyle(
            color: AppColors.darkGray,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.darkGray,
            size: 18,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.darkPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
