import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

@RoutePage()
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RiveAnimation.asset('assets/animations/loading_animation.riv'),
    );
  }
}
