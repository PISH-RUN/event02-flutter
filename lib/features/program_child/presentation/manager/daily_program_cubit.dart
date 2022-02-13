import 'package:flutter/cupertino.dart';
import 'package:kid_need_pishrun_event_02/common/cubits/simple_cubit.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import '../../domain/entities/program_child.dart';
import '../../domain/use_cases/program_child_main.dart';

class DailyProgramCubit extends SimpleCubit<List<ProgramChild>> {
  final DateManager Function() getRightNowDate;
  final ProgramChildMain _main;

  DailyProgramCubit({
    @required ProgramChildMain programChildMain,
    @required this.getRightNowDate,
  })  : _main = programChildMain,
        super(main: () => programChildMain.getDailyProgram(date: getRightNowDate()));

  Future<void> getData({DateManager date}) async {
    super.changeMain(() => _main.getDailyProgram(date: date ?? getRightNowDate()));
    super.getDataFromMain();
  }
}
