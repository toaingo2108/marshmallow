import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/pop_app_bar.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';

@RoutePage()
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});
  static const routeName = '/profile/help';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(
          title: 'Help',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const ProfileLongButton(title: ' FAQs'),
            Center(
              child: Image.asset(
                'assets/images/waving_marshmallow_right.png',
                height: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
