import 'package:dartz/dartz.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> registerWithPhoneNumber(String phoneNumber);

  Future<Either<Failure, Login>> loginWithOtp(String phoneNumber, String otp, String deviceName);

  String getToken();

  void saveTokenInStorage(String token);
}
