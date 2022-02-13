import 'package:equatable/equatable.dart';

enum FailureType { authentication, noInternet, other, serverError, somethingWentWrong }

class Failure extends Equatable {
  final FailureType failureType;
  final String message;

  const Failure(this.message, {this.failureType = FailureType.other});

  @override
  List<Object> get props => [message, failureType.toString()];
}
