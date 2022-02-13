import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_need_pishrun_event_02/application/colors.dart';
import 'package:kid_need_pishrun_event_02/application/enums/gender.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/loading_widget.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_button.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_seek_bar.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_text.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_text_field.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/show_snake_bar.dart';
import '../../domain/entities/child_sign_in.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';
import 'step2_page.dart';

class Step1Page extends StatefulWidget {
  static const String routeName = "/step1Profile";

  const Step1Page({Key key}) : super(key: key);

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: cloudyBlue, body: Container());
  }
}
