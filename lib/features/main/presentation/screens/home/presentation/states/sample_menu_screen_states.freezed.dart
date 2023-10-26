// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_menu_screen_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SampleMenuScreenStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) onError,
    required TResult Function(Weekday weekday, List<MenuGroup> menuGroups)
        onMenuFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial value) initial,
    required TResult Function(loading value) loading,
    required TResult Function(onError value) onError,
    required TResult Function(onMenuFetched value) onMenuFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onMenuFetched value)? onMenuFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onMenuFetched value)? onMenuFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleMenuScreenStatesCopyWith<$Res> {
  factory $SampleMenuScreenStatesCopyWith(SampleMenuScreenStates value,
          $Res Function(SampleMenuScreenStates) then) =
      _$SampleMenuScreenStatesCopyWithImpl<$Res, SampleMenuScreenStates>;
}

/// @nodoc
class _$SampleMenuScreenStatesCopyWithImpl<$Res,
        $Val extends SampleMenuScreenStates>
    implements $SampleMenuScreenStatesCopyWith<$Res> {
  _$SampleMenuScreenStatesCopyWithImpl(this._value, this._then);

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
    extends _$SampleMenuScreenStatesCopyWithImpl<$Res, _$initialImpl>
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
    return 'SampleMenuScreenStates.initial()';
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
    required TResult Function(Weekday weekday, List<MenuGroup> menuGroups)
        onMenuFetched,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
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
    required TResult Function(onMenuFetched value) onMenuFetched,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onMenuFetched value)? onMenuFetched,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onMenuFetched value)? onMenuFetched,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class initial implements SampleMenuScreenStates {
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
    extends _$SampleMenuScreenStatesCopyWithImpl<$Res, _$loadingImpl>
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
    return 'SampleMenuScreenStates.loading()';
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
    required TResult Function(Weekday weekday, List<MenuGroup> menuGroups)
        onMenuFetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
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
    required TResult Function(onMenuFetched value) onMenuFetched,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onMenuFetched value)? onMenuFetched,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onMenuFetched value)? onMenuFetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class loading implements SampleMenuScreenStates {
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
    extends _$SampleMenuScreenStatesCopyWithImpl<$Res, _$onErrorImpl>
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
    return 'SampleMenuScreenStates.onError(error: $error)';
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
    required TResult Function(Weekday weekday, List<MenuGroup> menuGroups)
        onMenuFetched,
  }) {
    return onError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
  }) {
    return onError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
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
    required TResult Function(onMenuFetched value) onMenuFetched,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onMenuFetched value)? onMenuFetched,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onMenuFetched value)? onMenuFetched,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class onError implements SampleMenuScreenStates {
  const factory onError(final String error) = _$onErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$onErrorImplCopyWith<_$onErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onMenuFetchedImplCopyWith<$Res> {
  factory _$$onMenuFetchedImplCopyWith(
          _$onMenuFetchedImpl value, $Res Function(_$onMenuFetchedImpl) then) =
      __$$onMenuFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Weekday weekday, List<MenuGroup> menuGroups});
}

/// @nodoc
class __$$onMenuFetchedImplCopyWithImpl<$Res>
    extends _$SampleMenuScreenStatesCopyWithImpl<$Res, _$onMenuFetchedImpl>
    implements _$$onMenuFetchedImplCopyWith<$Res> {
  __$$onMenuFetchedImplCopyWithImpl(
      _$onMenuFetchedImpl _value, $Res Function(_$onMenuFetchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekday = null,
    Object? menuGroups = null,
  }) {
    return _then(_$onMenuFetchedImpl(
      null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as Weekday,
      null == menuGroups
          ? _value._menuGroups
          : menuGroups // ignore: cast_nullable_to_non_nullable
              as List<MenuGroup>,
    ));
  }
}

/// @nodoc

class _$onMenuFetchedImpl implements onMenuFetched {
  const _$onMenuFetchedImpl(this.weekday, final List<MenuGroup> menuGroups)
      : _menuGroups = menuGroups;

  @override
  final Weekday weekday;
  final List<MenuGroup> _menuGroups;
  @override
  List<MenuGroup> get menuGroups {
    if (_menuGroups is EqualUnmodifiableListView) return _menuGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuGroups);
  }

  @override
  String toString() {
    return 'SampleMenuScreenStates.onMenuFetched(weekday: $weekday, menuGroups: $menuGroups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onMenuFetchedImpl &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            const DeepCollectionEquality()
                .equals(other._menuGroups, _menuGroups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, weekday, const DeepCollectionEquality().hash(_menuGroups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onMenuFetchedImplCopyWith<_$onMenuFetchedImpl> get copyWith =>
      __$$onMenuFetchedImplCopyWithImpl<_$onMenuFetchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) onError,
    required TResult Function(Weekday weekday, List<MenuGroup> menuGroups)
        onMenuFetched,
  }) {
    return onMenuFetched(weekday, menuGroups);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? onError,
    TResult? Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
  }) {
    return onMenuFetched?.call(weekday, menuGroups);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? onError,
    TResult Function(Weekday weekday, List<MenuGroup> menuGroups)?
        onMenuFetched,
    required TResult orElse(),
  }) {
    if (onMenuFetched != null) {
      return onMenuFetched(weekday, menuGroups);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial value) initial,
    required TResult Function(loading value) loading,
    required TResult Function(onError value) onError,
    required TResult Function(onMenuFetched value) onMenuFetched,
  }) {
    return onMenuFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial value)? initial,
    TResult? Function(loading value)? loading,
    TResult? Function(onError value)? onError,
    TResult? Function(onMenuFetched value)? onMenuFetched,
  }) {
    return onMenuFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial value)? initial,
    TResult Function(loading value)? loading,
    TResult Function(onError value)? onError,
    TResult Function(onMenuFetched value)? onMenuFetched,
    required TResult orElse(),
  }) {
    if (onMenuFetched != null) {
      return onMenuFetched(this);
    }
    return orElse();
  }
}

abstract class onMenuFetched implements SampleMenuScreenStates {
  const factory onMenuFetched(
          final Weekday weekday, final List<MenuGroup> menuGroups) =
      _$onMenuFetchedImpl;

  Weekday get weekday;
  List<MenuGroup> get menuGroups;
  @JsonKey(ignore: true)
  _$$onMenuFetchedImplCopyWith<_$onMenuFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
