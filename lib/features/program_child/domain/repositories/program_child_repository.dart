import 'package:dartz/dartz.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../entities/program_child.dart';

abstract class ProgramChildRepository {
  Future<Either<Failure, List<ProgramChild>>> getDailyProgram(int childId, DateManager date);

  Future<Either<Failure, void>> addNewProgram(int childId, ProgramChild programChild);

  Future<Either<Failure, void>> editProgram(int childId, ProgramChild programChild);
}
