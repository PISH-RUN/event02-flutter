import 'package:flutter/cupertino.dart';
import 'package:kid_need_pishrun_event_02/common/cubits/simple_cubit.dart';
import '../../domain/entities/program_child.dart';
import '../../domain/use_cases/program_child_main.dart';

class TodayProgramCubit extends SimpleCubit<List<ProgramChild>> {
  TodayProgramCubit({
    @required ProgramChildMain programChildMain,
  }) : super(main: () => programChildMain.getTodayProgram());

  Future<void> getData() async {
    super.getDataFromMain();
  }
}
