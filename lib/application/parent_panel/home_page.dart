import 'package:flutter/material.dart';
import 'package:kid_need_pishrun_event_02/application/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home";

  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
      drawer: NavigationDrawer(activeId: 1),
    );
  }
}
