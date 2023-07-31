import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/app_widget.dart';
import 'package:marshmallow/firebase_options.dart';
import 'package:marshmallow/services/shared_preferences.dart';
import 'package:marshmallow/utils/app_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Setup the locator
  setupLocator();
  // Setup Shared Preferences
  await SPService.init();
  runApp(
    ProviderScope(
      child: AppWidget(),
    ),
  );
}
//dart run build_runner watch --delete-conflicting-outputs
