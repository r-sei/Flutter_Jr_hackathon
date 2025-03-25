import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_provider.g.dart';

@riverpod
class BottomNavigationNotifier extends _$BottomNavigationNotifier {
  @override
  int build() {
    return 0;
  }

  void update(int newIndex) {
    state = newIndex;
  }
}
