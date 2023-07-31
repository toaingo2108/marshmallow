import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/application/bottom_nav_bar_notifier.dart';

final bottomNavBarNotifier = StateNotifierProvider<BottomNavBarNotifier, int>(
  (ref) => BottomNavBarNotifier(),
);
