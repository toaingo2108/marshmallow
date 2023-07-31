import 'package:flutter/cupertino.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:permission_handler/permission_handler.dart';

class NeedPermissionAlertDialog extends StatelessWidget {
  const NeedPermissionAlertDialog({
    super.key,
    required this.onLeftPressed,
    required this.onRightPressed,
    required this.description,
  });
  final String description;
  final void Function() onLeftPressed;
  final void Function() onRightPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Alert'),
      content: Text(description),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            openAppSettings();
            onLeftPressed();
            Navigator.pop(context);
          },
          child: const Text(
            'Open Settings',
            style: TextStyle(color: AppColors.blue),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () {
            onRightPressed();
            Navigator.pop(context);
          },
          child: const Text(
            'Close',
            style: TextStyle(
              color: AppColors.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
