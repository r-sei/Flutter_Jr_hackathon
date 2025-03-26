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
String _$penaltyControllerHash() => r'cec35e83f0910a98ae5e456011397fa9e3d3d6ad';

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

/// See also [penaltyController].
@ProviderFor(penaltyController)
const penaltyControllerProvider = PenaltyControllerFamily();

/// See also [penaltyController].
class PenaltyControllerFamily extends Family<TextEditingController> {
  /// See also [penaltyController].
  const PenaltyControllerFamily();

  /// See also [penaltyController].
  PenaltyControllerProvider call(
    Progress? progress,
  ) {
    return PenaltyControllerProvider(
      progress,
    );
  }

  @override
  PenaltyControllerProvider getProviderOverride(
    covariant PenaltyControllerProvider provider,
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
  String? get name => r'penaltyControllerProvider';
}

/// See also [penaltyController].
class PenaltyControllerProvider
    extends AutoDisposeProvider<TextEditingController> {
  /// See also [penaltyController].
  PenaltyControllerProvider(
    Progress? progress,
  ) : this._internal(
          (ref) => penaltyController(
            ref as PenaltyControllerRef,
            progress,
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
          progress: progress,
        );

  PenaltyControllerProvider._internal(
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
        progress: progress,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TextEditingController> createElement() {
    return _PenaltyControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PenaltyControllerProvider && other.progress == progress;
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
mixin PenaltyControllerRef on AutoDisposeProviderRef<TextEditingController> {
  /// The parameter `progress` of this provider.
  Progress? get progress;
}

class _PenaltyControllerProviderElement
    extends AutoDisposeProviderElement<TextEditingController>
    with PenaltyControllerRef {
  _PenaltyControllerProviderElement(super.provider);

  @override
  Progress? get progress => (origin as PenaltyControllerProvider).progress;
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
