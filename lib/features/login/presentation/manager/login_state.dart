import 'package:kid_need_pishrun_event_02/common/failures.dart';
import 'package:super_enum/super_enum.dart';

part "login_state.super.dart";

@superEnum
enum _LoginState {
  @object
  Success,

  @object
  Loading,

  @object
  readyToInput,

  @Data(fields: [
    DataField<Failure>('failure'),
  ])
  Error,
}
