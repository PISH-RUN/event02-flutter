import 'package:super_enum/super_enum.dart';

import '../failures.dart';

part "simple_3_state.super.dart";

@superEnum
enum _Simple3State {
  @generic
  @Data(fields: [
    DataField<Generic>('data'),
  ])
  Success,

  @object
  Loading,

  @Data(fields: [
    DataField<Failure>('failure'),
  ])
  Error,
}
