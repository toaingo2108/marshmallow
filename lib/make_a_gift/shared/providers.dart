import 'package:hooks_riverpod/hooks_riverpod.dart';

final isEnableSave = StateProvider.autoDispose<bool?>((ref) => false);
final numLengthText = StateProvider.autoDispose<int>((ref) => 0);
