import 'package:riverpod/riverpod.dart';

class BottomNavBarNotifier extends StateNotifier<int> {
  BottomNavBarNotifier() : super(2);

  int _index = 2;

  void setIndex(int index) {
    _index = index;
    state = _index;
  }

  int get index => _index;
}
