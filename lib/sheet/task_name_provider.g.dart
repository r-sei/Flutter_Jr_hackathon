// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_name_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskTitlesHash() => r'3c44c26926b3a77b6e6c29fe43d4cba7927c782e';

/// See also [taskTitles].
@ProviderFor(taskTitles)
final taskTitlesProvider = AutoDisposeFutureProvider<List<String>>.internal(
  taskTitles,
  name: r'taskTitlesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskTitlesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskTitlesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$taskNameNotifierHash() => r'2ecaf4b4c5ea98e5f50a79b5a93911761d23552d';

/// See also [TaskNameNotifier].
@ProviderFor(TaskNameNotifier)
final taskNameNotifierProvider =
    AutoDisposeNotifierProvider<TaskNameNotifier, String>.internal(
  TaskNameNotifier.new,
  name: r'taskNameNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskNameNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskNameNotifier = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
