import 'package:dartz/dartz.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../entities/program_child.dart';
import '../repositories/program_child_repository.dart';

class ProgramChildMain {
  final ProgramChildRepository repository;
  final DateManager Function() getRightNowDate;

  ProgramChildMain(this.repository, this.getRightNowDate);

  Future<Either<Failure, List<ProgramChild>>> getDailyProgram({DateManager date}) {
    //todo
  }

  Future<Either<Failure, List<ProgramChild>>> getTodayProgram() {
    //todo
  }

  Future<Either<Failure, void>> addNewProgram(ProgramChild programChild) {
    //todo
  }

  Future<Either<Failure, void>> editProgram(ProgramChild programChild) {
    //todo
  }
}
