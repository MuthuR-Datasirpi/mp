// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_listing_screen_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryListingScreenStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) onError,
    required TResult Function(List<Category> categories) onAllCategoriesFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(List<Category> categories)? onAllCategoriesFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(List<Category> categories)? onAllCategoriesFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial value) initial,
    required TResult Function(loading value) loading,
    required TResult Function(onError value) onError,
    required TResult Function(onAllCategoriesFetched value)
        onAllCategoriesFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListingScreenStatesCopyWith<$Res> {
  factory $CategoryListingScreenStatesCopyWith(
          CategoryListingScreenStates value,
          $Res Function(CategoryListingScreenStates) then) =
      _$CategoryListingScreenStatesCopyWithImpl<$Res,
          CategoryListingScreenStates>;
}

/// @nodoc
class _$CategoryListingScreenStatesCopyWithImpl<$Res,
        $Val extends CategoryListingScreenStates>
    implements $CategoryListingScreenStatesCopyWith<$Res> {
  _$CategoryListingScreenStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$initialImplCopyWith<$Res> {
  factory _$$initialImplCopyWith(
          _$initialImpl value, $Res Function(_$initialImpl) then) =
      __$$initialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$initialImplCopyWithImpl<$Res>
    extends _$CategoryListingScreenStatesCopyWithImpl<$Res, _$initialImpl>
    implements _$$initialImplCopyWith<$Res> {
  __$$initialImplCopyWithImpl(
      _$initialImpl _value, $Res Function(_$initialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$initialImpl implements initial {
  const _$initialImpl();

  @override
  String toString() {
    return 'CategoryListingScreenStates.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) onError,
    required TResult Function(List<Category> categories) onAllCategoriesFetched,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(List<Category> categories)? onAllCategoriesFetched,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(List<Category> categories)? onAllCategoriesFetched,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial value) initial,
    required TResult Function(loading value) loading,
    required TResult Function(onError value) onError,
    required TResult Function(onAllCategoriesFetched value)
        onAllCategoriesFetched,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class initial implements CategoryListingScreenStates {
  const factory initial() = _$initialImpl;
}

/// @nodoc
abstract class _$$loadingImplCopyWith<$Res> {
  factory _$$loadingImplCopyWith(
          _$loadingImpl value, $Res Function(_$loadingImpl) then) =
      __$$loadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingImplCopyWithImpl<$Res>
    extends _$CategoryListingScreenStatesCopyWithImpl<$Res, _$loadingImpl>
    implements _$$loadingImplCopyWith<$Res> {
  __$$loadingImplCopyWithImpl(
      _$loadingImpl _value, $Res Function(_$loadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadingImpl implements loading {
  const _$loadingImpl();

  @override
  String toString() {
    return 'CategoryListingScreenStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) onError,
    required TResult Function(List<Category> categories) onAllCategoriesFetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(List<Category> categories)? onAllCategoriesFetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(List<Category> categories)? onAllCategoriesFetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial value) initial,
    required TResult Function(loading value) loading,
    required TResult Function(onError value) onError,
    required TResult Function(onAllCategoriesFetched value)
        onAllCategoriesFetched,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class loading implements CategoryListingScreenStates {
  const factory loading() = _$loadingImpl;
}

/// @nodoc
abstract class _$$onErrorImplCopyWith<$Res> {
  factory _$$onErrorImplCopyWith(
          _$onErrorImpl value, $Res Function(_$onErrorImpl) then) =
      __$$onErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$onErrorImplCopyWithImpl<$Res>
    extends _$CategoryListingScreenStatesCopyWithImpl<$Res, _$onErrorImpl>
    implements _$$onErrorImplCopyWith<$Res> {
  __$$onErrorImplCopyWithImpl(
      _$onErrorImpl _value, $Res Function(_$onErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$onErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onErrorImpl implements onError {
  const _$onErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'CategoryListingScreenStates.onError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onErrorImplCopyWith<_$onErrorImpl> get copyWith =>
      __$$onErrorImplCopyWithImpl<_$onErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) onError,
    required TResult Function(List<Category> categories) onAllCategoriesFetched,
  }) {
    return onError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(List<Category> categories)? onAllCategoriesFetched,
  }) {
    return onError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(List<Category> categories)? onAllCategoriesFetched,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial value) initial,
    required TResult Function(loading value) loading,
    required TResult Function(onError value) onError,
    required TResult Function(onAllCategoriesFetched value)
        onAllCategoriesFetched,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class onError implements CategoryListingScreenStates {
  const factory onError(final String error) = _$onErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$onErrorImplCopyWith<_$onErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onAllCategoriesFetchedImplCopyWith<$Res> {
  factory _$$onAllCategoriesFetchedImplCopyWith(
          _$onAllCategoriesFetchedImpl value,
          $Res Function(_$onAllCategoriesFetchedImpl) then) =
      __$$onAllCategoriesFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class __$$onAllCategoriesFetchedImplCopyWithImpl<$Res>
    extends _$CategoryListingScreenStatesCopyWithImpl<$Res,
        _$onAllCategoriesFetchedImpl>
    implements _$$onAllCategoriesFetchedImplCopyWith<$Res> {
  __$$onAllCategoriesFetchedImplCopyWithImpl(
      _$onAllCategoriesFetchedImpl _value,
      $Res Function(_$onAllCategoriesFetchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$onAllCategoriesFetchedImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$onAllCategoriesFetchedImpl implements onAllCategoriesFetched {
  const _$onAllCategoriesFetchedImpl(final List<Category> categories)
      : _categories = categories;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoryListingScreenStates.onAllCategoriesFetched(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onAllCategoriesFetchedImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onAllCategoriesFetchedImplCopyWith<_$onAllCategoriesFetchedImpl>
      get copyWith => __$$onAllCategoriesFetchedImplCopyWithImpl<
          _$onAllCategoriesFetchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) onError,
    required TResult Function(List<Category> categories) onAllCategoriesFetched,
  }) {
    return onAllCategoriesFetched(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(List<Category> categories)? onAllCategoriesFetched,
  }) {
    return onAllCategoriesFetched?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(List<Category> categories)? onAllCategoriesFetched,
    required TResult orElse(),
  }) {
    if (onAllCategoriesFetched != null) {
      return onAllCategoriesFetched(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial value) initial,
    required TResult Function(loading value) loading,
    required TResult Function(onError value) onError,
    required TResult Function(onAllCategoriesFetched value)
        onAllCategoriesFetched,
  }) {
    return onAllCategoriesFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
  }) {
    return onAllCategoriesFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onAllCategoriesFetched value)? onAllCategoriesFetched,
    required TResult orElse(),
  }) {
    if (onAllCategoriesFetched != null) {
      return onAllCategoriesFetched(this);
    }
    return orElse();
  }
}

abstract class onAllCategoriesFetched implements CategoryListingScreenStates {
  const factory onAllCategoriesFetched(final List<Category> categories) =
      _$onAllCategoriesFetchedImpl;

  List<Category> get categories;
  @JsonKey(ignore: true)
  _$$onAllCategoriesFetchedImplCopyWith<_$onAllCategoriesFetchedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
