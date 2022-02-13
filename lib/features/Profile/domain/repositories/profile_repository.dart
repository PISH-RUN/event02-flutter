import 'package:dartz/dartz.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../entities/behaviour.dart';
import '../entities/behaviour_answer.dart';
import '../entities/character.dart';
import '../entities/child_sign_in.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ChildSignIn>> setBaseInformationOfChild(ChildSignIn child);

  Future<Either<Failure, bool>> setBehavioursOfChild(List<BehaviourAnswer> behavioursAnswer);

  Future<Either<Failure, bool>> setFavoriteCharacterOfChild(List<Character> characters);

  Future<Either<Failure, List<Behaviour>>> getAllBehavioursOfKidneedProfile();
}
