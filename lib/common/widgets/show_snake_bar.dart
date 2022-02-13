import 'package:flutter/material.dart';
import 'our_text.dart';

Future<void> showSnakeBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 2), content: OurText(text, textAlign: TextAlign.center, fontSize: 12, color: Color(0xffffffff))));
  return Future.value(null);
}
