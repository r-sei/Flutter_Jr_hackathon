import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visibility_provider.g.dart';

@riverpod
class VisibilityNotifier extends _$VisibilityNotifier {
  @override
  bool build() {
    return true;
  }

  void update(bool visibility) {
    state = visibility;
  }
}
