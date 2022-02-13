import 'package:dartz/dartz.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../entities/report.dart';
import '../repositories/report_repository.dart';

class ReportMain {
  final ReportRepository repository;

  ReportMain(this.repository);

  Future<Either<Failure, Report>> getReports({DateManager startTime, DateManager endTime}) async {
    //todo
  }
}
