import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../common/failures.dart';
import '../../domain/usecase/login_main.dart';
import 'login_state.dart';
import 'package:super_enum/super_enum.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginMain _loginMain;

  LoginCubit({
    @required LoginMain loginMain,
  })  : _loginMain = loginMain,
        super(LoginState.readyToInput());
}
