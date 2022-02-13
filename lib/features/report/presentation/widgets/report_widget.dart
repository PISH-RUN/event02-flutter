import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_need_pishrun_event_02/common/states/simple_3_state.dart';
import '../../domain/entities/report.dart';
import '../manager/report_cubit.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({Key key}) : super(key: key);

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, Simple3State<Report>>(
      builder: (context, state) {
        return state.when(
          success: (success) => Container(),
          loading: () => Container(),
          error: (error) => Container(),
        );
      },
    );
  }
}
