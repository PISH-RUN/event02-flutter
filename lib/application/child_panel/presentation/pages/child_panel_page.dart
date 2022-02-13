import 'package:flutter/material.dart';
import 'package:kid_need_pishrun_event_02/application/colors.dart';

class ChildPanelPage extends StatefulWidget {
  static const String routeName = "/childPanel";

  const ChildPanelPage({Key key}) : super(key: key);

  @override
  State<ChildPanelPage> createState() => _ChildPanelPageState();
}

class _ChildPanelPageState extends State<ChildPanelPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: cloudyBlue, body: Container());
  }
}
