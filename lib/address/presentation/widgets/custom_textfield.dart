//? The text fields for inputting the details of an address manually.
import 'package:flutter/material.dart';
import 'package:marshmallow/theme/theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.textInputAction = TextInputAction.next,
    this.initialText,
    this.editable = true,
    this.subtitle,
    this.onChanged,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w300,
    this.textAlign = TextAlign.start,
    this.successCondition,
  });
  final TextInputAction textInputAction;
  final String? initialText;
  final bool? successCondition;
  final String? subtitle;
  final bool editable;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double fontSize;
  final void Function(String)? onChanged;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 28,
              child: IgnorePointer(
                ignoring: !widget.editable,
                child: TextField(
                  textAlign: widget.textAlign,
                  controller: _controller,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: AppColors.textColor,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 20),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textFieldBorder),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textColor),
                    ),
                  ),
                  style: TextStyle(
                    fontWeight: widget.fontWeight,
                    fontSize: widget.fontSize,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
            if (widget.successCondition != null && widget.successCondition!)
              const Positioned(
                right: 10,
                top: 0,
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.green,
                  size: 20,
                ),
              )
          ],
        ),
        if (widget.subtitle != null)
          const SizedBox(
            height: 5,
          ),
        if (widget.subtitle != null)
          Text(
            widget.subtitle!,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.secondaryTextColor,
            ),
          ),
      ],
    );
  }
}
