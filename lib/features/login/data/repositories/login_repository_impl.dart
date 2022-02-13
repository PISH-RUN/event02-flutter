import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:kid_need_pishrun_event_02/application/constants.dart';
import 'package:kid_need_pishrun_event_02/common/data/data_source/local_storage_data_source.dart';
import 'package:kid_need_pishrun_event_02/common/data/data_source/remote_data_source.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../models/login_model.dart';
import '../../domain/entities/login.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteDataSource dataSource;
  final LocalStorageDataSource localStorageDataSource;

  LoginRepositoryImpl({
    @required this.dataSource,
    @required this.localStorageDataSource,
  });

  @override
  Future<Either<Failure, bool>> registerWithPhoneNumber(String phoneNumber) async {
    //todo
  }

  @override
  Future<Either<Failure, Login>> loginWithOtp(String phoneNumber, String otp, String deviceName) async {
    //todo
  }

  @override
  String getToken() {
    log("token is====> ${localStorageDataSource.getStringWithKey(TOKEN_KEY_SAVE_IN_LOCAL)}");
    return localStorageDataSource.getStringWithKey(TOKEN_KEY_SAVE_IN_LOCAL);
  }

  @override
  void saveTokenInStorage(String token) {
    localStorageDataSource.setStringWithKey(TOKEN_KEY_SAVE_IN_LOCAL, token);
  }
}
