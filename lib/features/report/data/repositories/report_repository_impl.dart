import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:kid_need_pishrun_event_02/common/data/data_source/remote_data_source.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import '../../domain/entities/report.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../../domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  final RemoteDataSource remoteDataSource;

  ReportRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Report>> getReports(DateManager startTime, DateManager endTime) {}
}
