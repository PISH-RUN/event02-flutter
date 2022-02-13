import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:kid_need_pishrun_event_02/common/data/data_source/remote_data_source.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../../domain/entities/program_child.dart';
import '../../domain/repositories/program_child_repository.dart';

class ProgramChildRepositoryImpl implements ProgramChildRepository {
  final RemoteDataSource remoteDataSource;

  ProgramChildRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ProgramChild>>> getDailyProgram(int childId, DateManager date) {
    return remoteDataSource.getListFromServer(
      url: "url",
      params: {},
      mapSuccess: (success) => null,
    );
  }

  @override
  Future<Either<Failure, void>> addNewProgram(int childId, ProgramChild programChild) {
    return remoteDataSource.postToServer(
      url: "url",
      params: {},
      mapSuccess: (success) => null,
    );
  }

  @override
  Future<Either<Failure, void>> editProgram(int childId, ProgramChild programChild) {
    return remoteDataSource.postToServer(
      url: "url",
      params: {},
      mapSuccess: (success) => null,
    );
  }
}
