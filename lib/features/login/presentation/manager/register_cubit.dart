import 'package:bloc/bloc.dart';
import 'package:kid_need_pishrun_event_02/common/utils.dart';
import 'login_cubit.dart';
import '../../domain/usecase/login_main.dart';
import 'login_state.dart';
import 'package:super_enum/super_enum.dart';

class RegisterCubit extends Cubit<LoginState> {
  final LoginMain _loginMain;

  RegisterCubit({
    @required LoginMain loginMain,
  })  : _loginMain = loginMain,
        super(LoginState.readyToInput());
}
