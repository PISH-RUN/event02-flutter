// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'profile_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState(this._type);

  factory ProfileState.success() = Success.create;

  factory ProfileState.loading() = Loading.create;

  factory ProfileState.loadingPage() = LoadingPage.create;

  factory ProfileState.readyToInput({@required List<Behaviour> behaviourList}) =
      ReadyToInput.create;

  factory ProfileState.error({@required Failure failure}) = Error.create;

  factory ProfileState.errorLoadingPage({@required Failure failure}) =
      ErrorLoadingPage.create;

  final _ProfileState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _ProfileState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() success,
      @required R Function() loading,
      @required R Function() loadingPage,
      @required R Function(ReadyToInput) readyToInput,
      @required R Function(Error) error,
      @required R Function(ErrorLoadingPage) errorLoadingPage}) {
    assert(() {
      if (success == null ||
          loading == null ||
          loadingPage == null ||
          readyToInput == null ||
          error == null ||
          errorLoadingPage == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.Success:
        return success();
      case _ProfileState.Loading:
        return loading();
      case _ProfileState.LoadingPage:
        return loadingPage();
      case _ProfileState.ReadyToInput:
        return readyToInput(this as ReadyToInput);
      case _ProfileState.Error:
        return error(this as Error);
      case _ProfileState.ErrorLoadingPage:
        return errorLoadingPage(this as ErrorLoadingPage);
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
      R Function() loadingPage,
      R Function(ReadyToInput) readyToInput,
      R Function(Error) error,
      R Function(ErrorLoadingPage) errorLoadingPage,
      @required R Function(ProfileState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.Success:
        if (success == null) break;
        return success();
      case _ProfileState.Loading:
        if (loading == null) break;
        return loading();
      case _ProfileState.LoadingPage:
        if (loadingPage == null) break;
        return loadingPage();
      case _ProfileState.ReadyToInput:
        if (readyToInput == null) break;
        return readyToInput(this as ReadyToInput);
      case _ProfileState.Error:
        if (error == null) break;
        return error(this as Error);
      case _ProfileState.ErrorLoadingPage:
        if (errorLoadingPage == null) break;
        return errorLoadingPage(this as ErrorLoadingPage);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() success,
      void Function() loading,
      void Function() loadingPage,
      void Function(ReadyToInput) readyToInput,
      void Function(Error) error,
      void Function(ErrorLoadingPage) errorLoadingPage}) {
    assert(() {
      if (success == null &&
          loading == null &&
          loadingPage == null &&
          readyToInput == null &&
          error == null &&
          errorLoadingPage == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.Success:
        if (success == null) break;
        return success();
      case _ProfileState.Loading:
        if (loading == null) break;
        return loading();
      case _ProfileState.LoadingPage:
        if (loadingPage == null) break;
        return loadingPage();
      case _ProfileState.ReadyToInput:
        if (readyToInput == null) break;
        return readyToInput(this as ReadyToInput);
      case _ProfileState.Error:
        if (error == null) break;
        return error(this as Error);
      case _ProfileState.ErrorLoadingPage:
        if (errorLoadingPage == null) break;
        return errorLoadingPage(this as ErrorLoadingPage);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Success extends ProfileState {
  const Success() : super(_ProfileState.Success);

  factory Success.create() = _SuccessImpl;
}

@immutable
class _SuccessImpl extends Success {
  const _SuccessImpl() : super();

  @override
  String toString() => 'Success()';
}

@immutable
abstract class Loading extends ProfileState {
  const Loading() : super(_ProfileState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class LoadingPage extends ProfileState {
  const LoadingPage() : super(_ProfileState.LoadingPage);

  factory LoadingPage.create() = _LoadingPageImpl;
}

@immutable
class _LoadingPageImpl extends LoadingPage {
  const _LoadingPageImpl() : super();

  @override
  String toString() => 'LoadingPage()';
}

@immutable
abstract class ReadyToInput extends ProfileState {
  const ReadyToInput({@required this.behaviourList})
      : super(_ProfileState.ReadyToInput);

  factory ReadyToInput.create({@required List<Behaviour> behaviourList}) =
      _ReadyToInputImpl;

  final List<Behaviour> behaviourList;

  /// Creates a copy of this ReadyToInput but with the given fields
  /// replaced with the new values.
  ReadyToInput copyWith({List<Behaviour> behaviourList});
}

@immutable
class _ReadyToInputImpl extends ReadyToInput {
  const _ReadyToInputImpl({@required this.behaviourList})
      : super(behaviourList: behaviourList);

  @override
  final List<Behaviour> behaviourList;

  @override
  _ReadyToInputImpl copyWith({Object behaviourList = superEnum}) =>
      _ReadyToInputImpl(
        behaviourList: behaviourList == superEnum
            ? this.behaviourList
            : behaviourList as List<Behaviour>,
      );
  @override
  String toString() => 'ReadyToInput(behaviourList: ${this.behaviourList})';
  @override
  List<Object> get props => [behaviourList];
}

@immutable
abstract class Error extends ProfileState {
  const Error({@required this.failure}) : super(_ProfileState.Error);

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

@immutable
abstract class ErrorLoadingPage extends ProfileState {
  const ErrorLoadingPage({@required this.failure})
      : super(_ProfileState.ErrorLoadingPage);

  factory ErrorLoadingPage.create({@required Failure failure}) =
      _ErrorLoadingPageImpl;

  final Failure failure;

  /// Creates a copy of this ErrorLoadingPage but with the given fields
  /// replaced with the new values.
  ErrorLoadingPage copyWith({Failure failure});
}

@immutable
class _ErrorLoadingPageImpl extends ErrorLoadingPage {
  const _ErrorLoadingPageImpl({@required this.failure})
      : super(failure: failure);

  @override
  final Failure failure;

  @override
  _ErrorLoadingPageImpl copyWith({Object failure = superEnum}) =>
      _ErrorLoadingPageImpl(
        failure: failure == superEnum ? this.failure : failure as Failure,
      );
  @override
  String toString() => 'ErrorLoadingPage(failure: ${this.failure})';
  @override
  List<Object> get props => [failure];
}
