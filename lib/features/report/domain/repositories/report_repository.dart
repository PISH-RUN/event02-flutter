import 'package:dartz/dartz.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../../domain/entities/report.dart';

abstract class ReportRepository {
  Future<Either<Failure, Report>> getReports(DateManager startTime, DateManager endTime);
}
