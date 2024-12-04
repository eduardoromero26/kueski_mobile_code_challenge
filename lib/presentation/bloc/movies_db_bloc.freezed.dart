// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_db_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoviesDBState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingStarted,
    required TResult Function(MovieResponse movies) loadedSuccess,
    required TResult Function(String message) loadedFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingStarted,
    TResult? Function(MovieResponse movies)? loadedSuccess,
    TResult? Function(String message)? loadedFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingStarted,
    TResult Function(MovieResponse movies)? loadedSuccess,
    TResult Function(String message)? loadedFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingStarted value) loadingStarted,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailed value) loadedFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingStarted value)? loadingStarted,
    TResult? Function(_LoadedSuccess value)? loadedSuccess,
    TResult? Function(_LoadedFailed value)? loadedFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingStarted value)? loadingStarted,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailed value)? loadedFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesDBStateCopyWith<$Res> {
  factory $MoviesDBStateCopyWith(
          MoviesDBState value, $Res Function(MoviesDBState) then) =
      _$MoviesDBStateCopyWithImpl<$Res, MoviesDBState>;
}

/// @nodoc
class _$MoviesDBStateCopyWithImpl<$Res, $Val extends MoviesDBState>
    implements $MoviesDBStateCopyWith<$Res> {
  _$MoviesDBStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MoviesDBStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl();

  @override
  String toString() {
    return 'MoviesDBState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingStarted,
    required TResult Function(MovieResponse movies) loadedSuccess,
    required TResult Function(String message) loadedFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingStarted,
    TResult? Function(MovieResponse movies)? loadedSuccess,
    TResult? Function(String message)? loadedFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingStarted,
    TResult Function(MovieResponse movies)? loadedSuccess,
    TResult Function(String message)? loadedFailed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingStarted value) loadingStarted,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailed value) loadedFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingStarted value)? loadingStarted,
    TResult? Function(_LoadedSuccess value)? loadedSuccess,
    TResult? Function(_LoadedFailed value)? loadedFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingStarted value)? loadingStarted,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailed value)? loadedFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MoviesDBState {
  factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingStartedImplCopyWith<$Res> {
  factory _$$LoadingStartedImplCopyWith(_$LoadingStartedImpl value,
          $Res Function(_$LoadingStartedImpl) then) =
      __$$LoadingStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStartedImplCopyWithImpl<$Res>
    extends _$MoviesDBStateCopyWithImpl<$Res, _$LoadingStartedImpl>
    implements _$$LoadingStartedImplCopyWith<$Res> {
  __$$LoadingStartedImplCopyWithImpl(
      _$LoadingStartedImpl _value, $Res Function(_$LoadingStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStartedImpl implements _LoadingStarted {
  _$LoadingStartedImpl();

  @override
  String toString() {
    return 'MoviesDBState.loadingStarted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingStarted,
    required TResult Function(MovieResponse movies) loadedSuccess,
    required TResult Function(String message) loadedFailed,
  }) {
    return loadingStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingStarted,
    TResult? Function(MovieResponse movies)? loadedSuccess,
    TResult? Function(String message)? loadedFailed,
  }) {
    return loadingStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingStarted,
    TResult Function(MovieResponse movies)? loadedSuccess,
    TResult Function(String message)? loadedFailed,
    required TResult orElse(),
  }) {
    if (loadingStarted != null) {
      return loadingStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingStarted value) loadingStarted,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailed value) loadedFailed,
  }) {
    return loadingStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingStarted value)? loadingStarted,
    TResult? Function(_LoadedSuccess value)? loadedSuccess,
    TResult? Function(_LoadedFailed value)? loadedFailed,
  }) {
    return loadingStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingStarted value)? loadingStarted,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailed value)? loadedFailed,
    required TResult orElse(),
  }) {
    if (loadingStarted != null) {
      return loadingStarted(this);
    }
    return orElse();
  }
}

abstract class _LoadingStarted implements MoviesDBState {
  factory _LoadingStarted() = _$LoadingStartedImpl;
}

/// @nodoc
abstract class _$$LoadedSuccessImplCopyWith<$Res> {
  factory _$$LoadedSuccessImplCopyWith(
          _$LoadedSuccessImpl value, $Res Function(_$LoadedSuccessImpl) then) =
      __$$LoadedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MovieResponse movies});
}

/// @nodoc
class __$$LoadedSuccessImplCopyWithImpl<$Res>
    extends _$MoviesDBStateCopyWithImpl<$Res, _$LoadedSuccessImpl>
    implements _$$LoadedSuccessImplCopyWith<$Res> {
  __$$LoadedSuccessImplCopyWithImpl(
      _$LoadedSuccessImpl _value, $Res Function(_$LoadedSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = freezed,
  }) {
    return _then(_$LoadedSuccessImpl(
      freezed == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as MovieResponse,
    ));
  }
}

/// @nodoc

class _$LoadedSuccessImpl implements _LoadedSuccess {
  _$LoadedSuccessImpl(this.movies);

  @override
  final MovieResponse movies;

  @override
  String toString() {
    return 'MoviesDBState.loadedSuccess(movies: $movies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedSuccessImpl &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(movies));

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedSuccessImplCopyWith<_$LoadedSuccessImpl> get copyWith =>
      __$$LoadedSuccessImplCopyWithImpl<_$LoadedSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingStarted,
    required TResult Function(MovieResponse movies) loadedSuccess,
    required TResult Function(String message) loadedFailed,
  }) {
    return loadedSuccess(movies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingStarted,
    TResult? Function(MovieResponse movies)? loadedSuccess,
    TResult? Function(String message)? loadedFailed,
  }) {
    return loadedSuccess?.call(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingStarted,
    TResult Function(MovieResponse movies)? loadedSuccess,
    TResult Function(String message)? loadedFailed,
    required TResult orElse(),
  }) {
    if (loadedSuccess != null) {
      return loadedSuccess(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingStarted value) loadingStarted,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailed value) loadedFailed,
  }) {
    return loadedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingStarted value)? loadingStarted,
    TResult? Function(_LoadedSuccess value)? loadedSuccess,
    TResult? Function(_LoadedFailed value)? loadedFailed,
  }) {
    return loadedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingStarted value)? loadingStarted,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailed value)? loadedFailed,
    required TResult orElse(),
  }) {
    if (loadedSuccess != null) {
      return loadedSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadedSuccess implements MoviesDBState {
  factory _LoadedSuccess(final MovieResponse movies) = _$LoadedSuccessImpl;

  MovieResponse get movies;

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedSuccessImplCopyWith<_$LoadedSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedFailedImplCopyWith<$Res> {
  factory _$$LoadedFailedImplCopyWith(
          _$LoadedFailedImpl value, $Res Function(_$LoadedFailedImpl) then) =
      __$$LoadedFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoadedFailedImplCopyWithImpl<$Res>
    extends _$MoviesDBStateCopyWithImpl<$Res, _$LoadedFailedImpl>
    implements _$$LoadedFailedImplCopyWith<$Res> {
  __$$LoadedFailedImplCopyWithImpl(
      _$LoadedFailedImpl _value, $Res Function(_$LoadedFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoadedFailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadedFailedImpl implements _LoadedFailed {
  _$LoadedFailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MoviesDBState.loadedFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedFailedImplCopyWith<_$LoadedFailedImpl> get copyWith =>
      __$$LoadedFailedImplCopyWithImpl<_$LoadedFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingStarted,
    required TResult Function(MovieResponse movies) loadedSuccess,
    required TResult Function(String message) loadedFailed,
  }) {
    return loadedFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingStarted,
    TResult? Function(MovieResponse movies)? loadedSuccess,
    TResult? Function(String message)? loadedFailed,
  }) {
    return loadedFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingStarted,
    TResult Function(MovieResponse movies)? loadedSuccess,
    TResult Function(String message)? loadedFailed,
    required TResult orElse(),
  }) {
    if (loadedFailed != null) {
      return loadedFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingStarted value) loadingStarted,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailed value) loadedFailed,
  }) {
    return loadedFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingStarted value)? loadingStarted,
    TResult? Function(_LoadedSuccess value)? loadedSuccess,
    TResult? Function(_LoadedFailed value)? loadedFailed,
  }) {
    return loadedFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingStarted value)? loadingStarted,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailed value)? loadedFailed,
    required TResult orElse(),
  }) {
    if (loadedFailed != null) {
      return loadedFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadedFailed implements MoviesDBState {
  factory _LoadedFailed(final String message) = _$LoadedFailedImpl;

  String get message;

  /// Create a copy of MoviesDBState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedFailedImplCopyWith<_$LoadedFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
