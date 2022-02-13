import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_need_pishrun_event_02/common/date_manager.dart';
import 'package:kid_need_pishrun_event_02/common/states/simple_3_state.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_card.dart';

import '../../domain/entities/program_child.dart';
import '../manager/daily_program_cubit.dart';

class DailyProgramWidget extends StatefulWidget {
  final DateManager date;

  const DailyProgramWidget(this.date, {Key key}) : super(key: key);

  @override
  _DailyProgramWidgetState createState() => _DailyProgramWidgetState();
}

class _DailyProgramWidgetState extends State<DailyProgramWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OurCard(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 8, right: 8.0),
      child: BlocBuilder<DailyProgramCubit, Simple3State<List<ProgramChild>>>(
        builder: (context, state) {
          return state.when(
            success: (success) => Container(),
            loading: () => Container(),
            error: (error) => Container(),
          );
        },
      ),
    );
  }
}
