import 'package:dartz/dartz.dart';
import 'package:kid_need_pishrun_event_02/application/constants.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import 'package:kid_need_pishrun_event_02/common/utils.dart';
import '../entities/login.dart';
import '../repositories/login_repository.dart';
import 'package:super_enum/super_enum.dart';

class LoginMain {
  final LoginRepository repository;

  LoginMain(this.repository);

  Future<Either<Failure, Login>> loginWithOtp({@required String phoneNumber, @required String password}) async {
    //todo
  }

  Future<Either<Failure, bool>> registerWithPhoneNumber({@required String phoneNumber}) async {
    //todo
  }

  Future<Either<Failure, bool>> resendVerifyCode({@required String phoneNumber}) async {
    //todo
  }
}
