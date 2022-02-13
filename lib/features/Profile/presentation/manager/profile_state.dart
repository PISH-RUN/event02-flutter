import 'package:kid_need_pishrun_event_02/common/failures.dart';
import '../../domain/entities/behaviour.dart';
import 'package:super_enum/super_enum.dart';

part "profile_state.super.dart";

@superEnum
enum _ProfileState {
  @object
  Success,

  @object
  Loading,

  @object
  LoadingPage,

  @Data(fields: [
    DataField<List<Behaviour>>('behaviourList'),
  ])
  ReadyToInput,

  @Data(fields: [
    DataField<Failure>('failure'),
  ])
  Error,

  @Data(fields: [
    DataField<Failure>('failure'),
  ])
  ErrorLoadingPage,
}
