import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskNameProvider = StateProvider<String?>((ref) {
  return 'タスクを選択してください';
});