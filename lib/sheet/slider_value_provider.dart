import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'slider_value_provider.g.dart';

final sliderValueProvider = StateProvider<double>((ref) {
  return 0;
});

// @riverpod
// class SliderValueNotifier extends _$SliderValueNotifier {
//   @override
//   double build() {
//     return 0;
//   }

//   void update(double sliderValue) {
//     state = sliderValue;
//   }
// }
