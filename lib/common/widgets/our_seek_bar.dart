import 'package:flutter/material.dart';

class OurSeekBar extends StatefulWidget {
  final void Function(int value) onChanged;
  final int min;
  final int max;

  const OurSeekBar({@required this.min, @required this.max, @required this.onChanged, Key key}) : super(key: key);

  @override
  _OurSeekBarState createState() => _OurSeekBarState();
}

class _OurSeekBarState extends State<OurSeekBar> {
  double seekBarValue;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
