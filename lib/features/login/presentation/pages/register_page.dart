import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_need_pishrun_event_02/application/texts.dart';
import 'package:kid_need_pishrun_event_02/common/utils.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/cloudy_scaffold_widget.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/loading_widget.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_button.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_card.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_text.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_text_field.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/show_snake_bar.dart';
import '../manager/login_state.dart';
import '../manager/register_cubit.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = "register";

  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CloudyScaffoldWidget(
      body: Container(),
    );
  }
}
