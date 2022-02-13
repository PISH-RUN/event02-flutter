import 'package:flutter/material.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/cloudy_scaffold_widget.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "login";

  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CloudyScaffoldWidget(
      body: Container(),
    );
  }
}
