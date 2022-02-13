import 'package:flutter/cupertino.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import '../../domain/entities/report.dart' show Report;
import '../../domain/use_cases/report_main.dart';
import 'package:kid_need_pishrun_event_02/common/cubits/simple_cubit.dart';

class ReportCubit extends SimpleCubit<Report> {
  final ReportMain _reportMain;

  ReportCubit({
    @required ReportMain reportMain,
  })  : _reportMain = reportMain,
        super();

  Future<void> getData({DateManager startTime, DateManager endTime}) async {
    //todo
  }
}
