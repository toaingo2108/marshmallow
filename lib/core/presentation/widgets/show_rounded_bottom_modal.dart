import 'package:flutter/material.dart';

//? Function to show rounded a bottom modal
Future showRoundedBottomModal(
  BuildContext context,
  Widget child, {
  bool isScrollable = true,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    builder: (context) {
      return child;
    },
  );
}
