import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:kid_need_pishrun_event_02/common/data/data_source/remote_data_source.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../../domain/entities/behaviour.dart';
import '../../domain/entities/behaviour_answer.dart';
import '../../domain/entities/character.dart';
import '../../domain/entities/child_sign_in.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RemoteDataSource dataSource;

  ProfileRepositoryImpl({
    @required this.dataSource,
  });

  @override
  Future<Either<Failure, ChildSignIn>> setBaseInformationOfChild(ChildSignIn child) {
    //todo
  }

  @override
  Future<Either<Failure, bool>> setBehavioursOfChild(List<BehaviourAnswer> behavioursAnswer) {
    //todo
  }

  @override
  Future<Either<Failure, bool>> setFavoriteCharacterOfChild(List<Character> characters) async {
    //todo
  }

  @override
  Future<Either<Failure, List<Behaviour>>> getAllBehavioursOfKidneedProfile() {
    //todo
  }
}
