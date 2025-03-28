// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksHash() => r'7400c4ae6713fc72f390a59f5f7badf8385043a0';

/// See also [tasks].
@ProviderFor(tasks)
final tasksProvider =
    AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>>.internal(
  tasks,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksRef
    = AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>>;
String _$titleControllerHash() => r'705fda312c090a77c96f347498a126d194d01d16';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [titleController].
@ProviderFor(titleController)
const titleControllerProvider = TitleControllerFamily();

/// See also [titleController].
class TitleControllerFamily extends Family<TextEditingController> {
  /// See also [titleController].
  const TitleControllerFamily();

  /// See also [titleController].
  TitleControllerProvider call(
    Task? task,
  ) {
    return TitleControllerProvider(
      task,
    );
  }

  @override
  TitleControllerProvider getProviderOverride(
    covariant TitleControllerProvider provider,
  ) {
    return call(
      provider.task,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'titleControllerProvider';
}

/// See also [titleController].
class TitleControllerProvider
    extends AutoDisposeProvider<TextEditingController> {
  /// See also [titleController].
  TitleControllerProvider(
    Task? task,
  ) : this._internal(
          (ref) => titleController(
            ref as TitleControllerRef,
            task,
          ),
          from: titleControllerProvider,
          name: r'titleControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$titleControllerHash,
          dependencies: TitleControllerFamily._dependencies,
          allTransitiveDependencies:
              TitleControllerFamily._allTransitiveDependencies,
          task: task,
        );

  TitleControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.task,
  }) : super.internal();

  final Task? task;

  @override
  Override overrideWith(
    TextEditingController Function(TitleControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TitleControllerProvider._internal(
        (ref) => create(ref as TitleControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        task: task,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TextEditingController> createElement() {
    return _TitleControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TitleControllerProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TitleControllerRef on AutoDisposeProviderRef<TextEditingController> {
  /// The parameter `task` of this provider.
  Task? get task;
}

class _TitleControllerProviderElement
    extends AutoDisposeProviderElement<TextEditingController>
    with TitleControllerRef {
  _TitleControllerProviderElement(super.provider);

  @override
  Task? get task => (origin as TitleControllerProvider).task;
}

String _$penaltyControllerHash() => r'f68105bed7259c8afdf40526bb38b8d6ca824c3d';

/// See also [penaltyController].
@ProviderFor(penaltyController)
const penaltyControllerProvider = PenaltyControllerFamily();

/// See also [penaltyController].
class PenaltyControllerFamily extends Family<TextEditingController> {
  /// See also [penaltyController].
  const PenaltyControllerFamily();

  /// See also [penaltyController].
  PenaltyControllerProvider call(
    Task? task,
  ) {
    return PenaltyControllerProvider(
      task,
    );
  }

  @override
  PenaltyControllerProvider getProviderOverride(
    covariant PenaltyControllerProvider provider,
  ) {
    return call(
      provider.task,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'penaltyControllerProvider';
}

/// See also [penaltyController].
class PenaltyControllerProvider
    extends AutoDisposeProvider<TextEditingController> {
  /// See also [penaltyController].
  PenaltyControllerProvider(
    Task? task,
  ) : this._internal(
          (ref) => penaltyController(
            ref as PenaltyControllerRef,
            task,
          ),
          from: penaltyControllerProvider,
          name: r'penaltyControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$penaltyControllerHash,
          dependencies: PenaltyControllerFamily._dependencies,
          allTransitiveDependencies:
              PenaltyControllerFamily._allTransitiveDependencies,
          task: task,
        );

  PenaltyControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.task,
  }) : super.internal();

  final Task? task;

  @override
  Override overrideWith(
    TextEditingController Function(PenaltyControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PenaltyControllerProvider._internal(
        (ref) => create(ref as PenaltyControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        task: task,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TextEditingController> createElement() {
    return _PenaltyControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PenaltyControllerProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PenaltyControllerRef on AutoDisposeProviderRef<TextEditingController> {
  /// The parameter `task` of this provider.
  Task? get task;
}

class _PenaltyControllerProviderElement
    extends AutoDisposeProviderElement<TextEditingController>
    with PenaltyControllerRef {
  _PenaltyControllerProviderElement(super.provider);

  @override
  Task? get task => (origin as PenaltyControllerProvider).task;
}

String _$taskEditHash() => r'1534d4e928c9e84d421eca449a6e7abd5bbc8625';

/// See also [TaskEdit].
@ProviderFor(TaskEdit)
final taskEditProvider = AutoDisposeNotifierProvider<TaskEdit, String>.internal(
  TaskEdit.new,
  name: r'taskEditProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskEditHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskEdit = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
