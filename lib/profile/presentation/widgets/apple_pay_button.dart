import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/container_with_shadow.dart';

class ApplePayButton extends StatelessWidget {
  const ApplePayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWithShadow(
      height: 41,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              await LaunchApp.openApp(
                // androidPackageName: 'net.pulsesecure.pulsesecure',
                iosUrlScheme: 'wallet://',

                // openStore: false
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/apple_pay.png',
                  height: 20,
                  width: 47,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
