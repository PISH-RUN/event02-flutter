// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'login_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginState extends Equatable {
  const LoginState(this._type);

  factory LoginState.success() = Success.create;

  factory LoginState.loading() = Loading.create;

  factory LoginState.readyToInput() = readyToInput.create;

  factory LoginState.error({@required Failure failure}) = Error.create;

  final _LoginState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _LoginState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() success,
      @required R Function() loading,
      @required R Function() readyToInput,
      @required R Function(Error) error}) {
    assert(() {
      if (success == null ||
          loading == null ||
          readyToInput == null ||
          error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.Success:
        return success();
      case _LoginState.Loading:
        return loading();
      case _LoginState.readyToInput:
        return readyToInput();
      case _LoginState.Error:
        return error(this as Error);
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() success,
      R Function() loading,
      R Function() readyToInput,
      R Function(Error) error,
      @required R Function(LoginState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.Success:
        if (success == null) break;
        return success();
      case _LoginState.Loading:
        if (loading == null) break;
        return loading();
      case _LoginState.readyToInput:
        if (readyToInput == null) break;
        return readyToInput();
      case _LoginState.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() success,
      void Function() loading,
      void Function() readyToInput,
      void Function(Error) error}) {
    assert(() {
      if (success == null &&
          loading == null &&
          readyToInput == null &&
          error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.Success:
        if (success == null) break;
        return success();
      case _LoginState.Loading:
        if (loading == null) break;
        return loading();
      case _LoginState.readyToInput:
        if (readyToInput == null) break;
        return readyToInput();
      case _LoginState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Success extends LoginState {
  const Success() : super(_LoginState.Success);

  factory Success.create() = _SuccessImpl;
}

@immutable
class _SuccessImpl extends Success {
  const _SuccessImpl() : super();

  @override
  String toString() => 'Success()';
}

@immutable
abstract class Loading extends LoginState {
  const Loading() : super(_LoginState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class readyToInput extends LoginState {
  const readyToInput() : super(_LoginState.readyToInput);

  factory readyToInput.create() = _readyToInputImpl;
}

@immutable
class _readyToInputImpl extends readyToInput {
  const _readyToInputImpl() : super();

  @override
  String toString() => 'readyToInput()';
}

@immutable
abstract class Error extends LoginState {
  const Error({@required this.failure}) : super(_LoginState.Error);

  factory Error.create({@required Failure failure}) = _ErrorImpl;

  final Failure failure;

  /// Creates a copy of this Error but with the given fields
  /// replaced with the new values.
  Error copyWith({Failure failure});
}

@immutable
class _ErrorImpl extends Error {
  const _ErrorImpl({@required this.failure}) : super(failure: failure);

  @override
  final Failure failure;

  @override
  _ErrorImpl copyWith({Object failure = superEnum}) => _ErrorImpl(
        failure: failure == superEnum ? this.failure : failure as Failure,
      );
  @override
  String toString() => 'Error(failure: ${this.failure})';
  @override
  List<Object> get props => [failure];
}
