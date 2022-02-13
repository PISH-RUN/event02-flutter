import 'package:dartz/dartz.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../entities/behaviour.dart';
import '../entities/behaviour_answer.dart';
import '../entities/character.dart';
import '../entities/child_sign_in.dart';
import '../repositories/profile_repository.dart';

class ProfileMain {
  final ProfileRepository repository;

  ProfileMain(this.repository);

  Future<Either<Failure, bool>> setBaseInformationOfChild(ChildSignIn child) async {
    //todo
  }

  Future<Either<Failure, bool>> setBehavioursOfChild(List<BehaviourAnswer> behavioursAnswer) {
    //todo
  }

  Future<Either<Failure, List<Behaviour>>> getAllBehavioursOfKidneedProfile() {
    //todo
  }

  Future<Either<Failure, bool>> setFavoriteCharacterOfChild(List<Character> characters) {
    //todo
  }
}
