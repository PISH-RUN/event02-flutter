import 'package:flutter/material.dart';

class CloudyScaffoldWidget extends StatefulWidget {
  final Widget body;

  const CloudyScaffoldWidget({@required this.body, Key key}) : super(key: key);

  @override
  _CloudyScaffoldWidgetState createState() => _CloudyScaffoldWidgetState();
}

class _CloudyScaffoldWidgetState extends State<CloudyScaffoldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
