import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slider_value_provider.g.dart';

@riverpod
class SliderValueNotifier extends _$SliderValueNotifier {
  @override
  double build() {
    return 0;
  }

  void update(double sliderValue) {
    state = sliderValue;
  }
}
