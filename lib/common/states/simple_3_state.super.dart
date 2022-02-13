// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'simple_3_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class Simple3State<T> extends Equatable {
  const Simple3State(this._type);

  factory Simple3State.success({@required T data}) = Success<T>.create;

  factory Simple3State.loading() = Loading<T>.create;

  factory Simple3State.error({@required Failure failure}) = Error<T>.create;

  final _Simple3State _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _Simple3State [_type]s defined.
  R when<R extends Object>(
      {@required R Function(Success<T>) success,
      @required R Function() loading,
      @required R Function(Error<T>) error}) {
    assert(() {
      if (success == null || loading == null || error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _Simple3State.Success:
        return success(this as Success);
      case _Simple3State.Loading:
        return loading();
      case _Simple3State.Error:
        return error(this as Error);
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function(Success<T>) success,
      R Function() loading,
      R Function(Error<T>) error,
      @required R Function(Simple3State<T>) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _Simple3State.Success:
        if (success == null) break;
        return success(this as Success);
      case _Simple3State.Loading:
        if (loading == null) break;
        return loading();
      case _Simple3State.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function(Success<T>) success,
      void Function() loading,
      void Function(Error<T>) error}) {
    assert(() {
      if (success == null && loading == null && error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _Simple3State.Success:
        if (success == null) break;
        return success(this as Success);
      case _Simple3State.Loading:
        if (loading == null) break;
        return loading();
      case _Simple3State.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Success<T> extends Simple3State<T> {
  const Success({@required this.data}) : super(_Simple3State.Success);

  factory Success.create({@required T data}) = _SuccessImpl<T>;

  final T data;

  /// Creates a copy of this Success but with the given fields
  /// replaced with the new values.
  Success<T> copyWith({T data});
}

@immutable
class _SuccessImpl<T> extends Success<T> {
  const _SuccessImpl({@required this.data}) : super(data: data);

  @override
  final T data;

  @override
  _SuccessImpl<T> copyWith({Object data = superEnum}) => _SuccessImpl(
        data: data == superEnum ? this.data : data as T,
      );
  @override
  String toString() => 'Success(data: ${this.data})';
  @override
  List<Object> get props => [data];
}

@immutable
abstract class Loading<T> extends Simple3State<T> {
  const Loading() : super(_Simple3State.Loading);

  factory Loading.create() = _LoadingImpl<T>;
}

@immutable
class _LoadingImpl<T> extends Loading<T> {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Error<T> extends Simple3State<T> {
  const Error({@required this.failure}) : super(_Simple3State.Error);

  factory Error.create({@required Failure failure}) = _ErrorImpl<T>;

  final Failure failure;

  /// Creates a copy of this Error but with the given fields
  /// replaced with the new values.
  Error<T> copyWith({Failure failure});
}

@immutable
class _ErrorImpl<T> extends Error<T> {
  const _ErrorImpl({@required this.failure}) : super(failure: failure);

  @override
  final Failure failure;

  @override
  _ErrorImpl<T> copyWith({Object failure = superEnum}) => _ErrorImpl(
        failure: failure == superEnum ? this.failure : failure as Failure,
      );
  @override
  String toString() => 'Error(failure: ${this.failure})';
  @override
  List<Object> get props => [failure];
}
