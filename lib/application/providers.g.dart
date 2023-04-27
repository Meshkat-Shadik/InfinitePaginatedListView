// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'619a68fed2996c62f82eccf1cba4c4b7d0bb41c1';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$postRepositoryHash() => r'36c486a0353e30ecb61234b4ad9fe373b015e8fe';

/// See also [postRepository].
@ProviderFor(postRepository)
final postRepositoryProvider = AutoDisposeProvider<PostRepository>.internal(
  postRepository,
  name: r'postRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostRepositoryRef = AutoDisposeProviderRef<PostRepository>;
String _$postsHash() => r'1266acfa1b763d3960dd07a4a95f981c25317130';

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

typedef PostsRef = AutoDisposeFutureProviderRef<List<Post>>;

/// See also [posts].
@ProviderFor(posts)
const postsProvider = PostsFamily();

/// See also [posts].
class PostsFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [posts].
  const PostsFamily();

  /// See also [posts].
  PostsProvider call({
    required int page,
  }) {
    return PostsProvider(
      page: page,
    );
  }

  @override
  PostsProvider getProviderOverride(
    covariant PostsProvider provider,
  ) {
    return call(
      page: provider.page,
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
  String? get name => r'postsProvider';
}

/// See also [posts].
class PostsProvider extends AutoDisposeFutureProvider<List<Post>> {
  /// See also [posts].
  PostsProvider({
    required this.page,
  }) : super.internal(
          (ref) => posts(
            ref,
            page: page,
          ),
          from: postsProvider,
          name: r'postsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postsHash,
          dependencies: PostsFamily._dependencies,
          allTransitiveDependencies: PostsFamily._allTransitiveDependencies,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is PostsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$postHash() => r'd8a733f54ecfbef58dbb910d00f98c5dec2ee9e2';

/// See also [post].
@ProviderFor(post)
final postProvider = AutoDisposeProvider<Post>.internal(
  post,
  name: r'postProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostRef = AutoDisposeProviderRef<Post>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
