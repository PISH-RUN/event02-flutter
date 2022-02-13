import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kid_need_pishrun_event_02/application/constants.dart';
import '../model/server_failure.dart';
import '../../utils.dart';
import 'local_storage_data_source.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final Function isInternetEnable;
  final LocalStorageDataSource localStorageDataSource;

  RemoteDataSourceImpl({@required this.client, @required this.isInternetEnable, @required this.localStorageDataSource});

  //todo make Bearer in init of main thread
  Map<String, String> get defaultHeader {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${localStorageDataSource.getStringWithKey(TOKEN_KEY_SAVE_IN_LOCAL.toString())}'
    };
  }

  @override
  Future<Either<ServerFailure, List<T>>> getListFromServer<T>(
      {@required String url, @required Map<String, dynamic> params, @required T Function(Map<String, dynamic> success) mapSuccess}) async {
    return getFromServer<List<T>>(
        url: url,
        params: params,
        mapSuccess: (json) {
          final listDynamic = json as List;
          List<T> listObject = listDynamic.map<T>((e) => mapSuccess(e)).toList();
          return listObject;
        });
  }

  @override
  Future<Either<ServerFailure, T>> getFromServer<T>(
      {@required String url, @required Map<String, dynamic> params, @required T Function(Map<String, dynamic> success) mapSuccess}) async {
    if (!await isInternetEnable()) return Left(ServerFailure.noInternet());
    final finalUri = Uri.parse(url).replace(queryParameters: params);
    return _callFunctionOfServer(
      response: client.get(finalUri, headers: defaultHeader),
      mapSuccess: mapSuccess,
      params: params,
      url: url,
      methodName: "get",
    );
  }

  @override
  Stream<Either<ServerFailure, T>> getFromServerWithOfflineFirst<T>(
      {String url, Map<String, dynamic> params, T Function(Map<String, dynamic> success) mapSuccess}) async* {
    final finalUri = Uri.parse(url).replace(queryParameters: params);
    if (GetStorage().hasData(finalUri.toString())) {
      yield Right(mapSuccess(GetStorage().read<Map<String, dynamic>>(finalUri.toString())));
    }
    if (!await isInternetEnable()) {
      yield Left(ServerFailure.noInternet());
    } else {
      final output = await _callFunctionOfServer<Map<String, dynamic>>(
        response: client.get(finalUri, headers: defaultHeader),
        mapSuccess: (data) => data,
        params: params,
        url: url,
        methodName: "get",
      );
      yield output.fold(
        (l) => Left(l),
        (r) {
          GetStorage().write(finalUri.toString(), r);
          return Right(mapSuccess(r));
        },
      );
    }
  }

  @override
  Future<Either<ServerFailure, T>> postToServer<T>(
      {@required String url, @required Map<String, dynamic> params, @required T Function(Map<String, dynamic> success) mapSuccess}) async {
    if (!await isInternetEnable()) return Left(ServerFailure.noInternet());
    return _callFunctionOfServer(
      response: client.post(Uri.parse(url), body: jsonEncode(params), headers: defaultHeader),
      mapSuccess: mapSuccess,
      params: params,
      url: url,
      methodName: "post",
    );
  }

  @override
  Future<Either<ServerFailure, T>> putToServer<T>(
      {@required String url, @required Map<String, dynamic> params, @required T Function(Map<String, dynamic> success) mapSuccess}) async {
    if (!await isInternetEnable()) return Left(ServerFailure.noInternet());
    return _callFunctionOfServer(
      response: client.put(Uri.parse(url), body: jsonEncode(params), headers: defaultHeader),
      mapSuccess: mapSuccess,
      params: params,
      url: url,
      methodName: "put",
    );
  }

  Future<Either<ServerFailure, T>> _callFunctionOfServer<T>(
      {@required String methodName,
      @required Future<http.Response> response,
      @required String url,
      @required Map<String, dynamic> params,
      @required T Function(Map<String, dynamic> success) mapSuccess}) async {
    try {
      log("$methodName====> url ==> $url");
      log("$methodName====> bodyParameters ==> $params");
      http.Response finalResponse = await response;
      log("$methodName====> response.statusCode ==> ${finalResponse.statusCode}");

      if (isSuccessfulHttp(finalResponse)) {
        return Right(mapSuccess(jsonDecode(finalResponse.body)));
      } else {
        log("post====> response.error ==> ${finalResponse.body}");
        log("post====> response.error ==> ${finalResponse.body.isEmpty}");
        handleGlobalErrorInServer(finalResponse);
        return Left(finalResponse.statusCode == AUTHENTICATION_IS_WRONG_STATUS_CODE ? ServerFailure.notLoggedInYet() : ServerFailure(finalResponse));
      }
    } on Exception catch (e) {
      log("post====> crash ==> ${e.toString()}");
      return Left(ServerFailure.somethingWentWrong());
    }
  }

  void handleGlobalErrorInServer(http.Response response) {
    if (response.statusCode == AUTHENTICATION_IS_WRONG_STATUS_CODE) _removeTokenBecauseIfExpire(response);
  }

  void _removeTokenBecauseIfExpire(http.Response response) {
    localStorageDataSource.setStringWithKey(TOKEN_KEY_SAVE_IN_LOCAL, "");
  }
}
