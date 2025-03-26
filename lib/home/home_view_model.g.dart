// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$progressHash() => r'24bb7a34470cc462b8c25f8cebb49cef0f756d01';

/// See also [progress].
@ProviderFor(progress)
final progressProvider =
    AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>>.internal(
  progress,
  name: r'progressProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$progressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProgressRef
    = AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>>;
String _$progressControllerHash() =>
    r'92952314b2f0a1f3f242c621627bdf6afa908db4';

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

/// See also [progressController].
@ProviderFor(progressController)
const progressControllerProvider = ProgressControllerFamily();

/// See also [progressController].
class ProgressControllerFamily extends Family<TextEditingController> {
  /// See also [progressController].
  const ProgressControllerFamily();

  /// See also [progressController].
  ProgressControllerProvider call(
    Progress? progress,
  ) {
    return ProgressControllerProvider(
      progress,
    );
  }

  @override
  ProgressControllerProvider getProviderOverride(
    covariant ProgressControllerProvider provider,
  ) {
    return call(
      provider.progress,
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
  String? get name => r'progressControllerProvider';
}

/// See also [progressController].
class ProgressControllerProvider
    extends AutoDisposeProvider<TextEditingController> {
  /// See also [progressController].
  ProgressControllerProvider(
    Progress? progress,
  ) : this._internal(
          (ref) => progressController(
            ref as ProgressControllerRef,
            progress,
          ),
          from: progressControllerProvider,
          name: r'progressControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$progressControllerHash,
          dependencies: ProgressControllerFamily._dependencies,
          allTransitiveDependencies:
              ProgressControllerFamily._allTransitiveDependencies,
          progress: progress,
        );

  ProgressControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.progress,
  }) : super.internal();

  final Progress? progress;

  @override
  Override overrideWith(
    TextEditingController Function(ProgressControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProgressControllerProvider._internal(
        (ref) => create(ref as ProgressControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        progress: progress,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TextEditingController> createElement() {
    return _ProgressControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgressControllerProvider && other.progress == progress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, progress.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProgressControllerRef on AutoDisposeProviderRef<TextEditingController> {
  /// The parameter `progress` of this provider.
  Progress? get progress;
}

class _ProgressControllerProviderElement
    extends AutoDisposeProviderElement<TextEditingController>
    with ProgressControllerRef {
  _ProgressControllerProviderElement(super.provider);

  @override
  Progress? get progress => (origin as ProgressControllerProvider).progress;
}

String _$progressNotifierHash() => r'f00985d1ec6f218f3f557c7b273fe5585b9b1fa2';

/// See also [ProgressNotifier].
@ProviderFor(ProgressNotifier)
final progressNotifierProvider =
    AutoDisposeNotifierProvider<ProgressNotifier, String>.internal(
  ProgressNotifier.new,
  name: r'progressNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$progressNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProgressNotifier = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
