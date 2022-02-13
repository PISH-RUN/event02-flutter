import 'package:flutter/material.dart';

class OurButton extends StatelessWidget {
  final bool isHighlighted;
  final Widget child;
  final void Function() onTap;

  const OurButton({@required this.child, @required this.onTap, this.isHighlighted = false, Key key}) : super(key: key);

  final double fontSize = 13;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
