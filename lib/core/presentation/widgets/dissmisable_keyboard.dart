//? Wrapper to dismiss a the keyboard if user taps anywhere outside of the textfield.
import 'package:flutter/material.dart';

class DismissibleKeyboard extends StatelessWidget {
  const DismissibleKeyboard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
