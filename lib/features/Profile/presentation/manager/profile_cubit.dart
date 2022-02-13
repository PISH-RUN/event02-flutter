import 'package:bloc/bloc.dart';
import '../../domain/use_cases/profile_main.dart';
import 'profile_state.dart';
import 'package:super_enum/super_enum.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileMain _profileMain;

  ProfileCubit({
    @required ProfileMain profileMain,
  })  : _profileMain = profileMain,
        super(ProfileState.readyToInput(behaviourList: []));
}
