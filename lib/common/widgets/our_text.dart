import 'package:flutter/material.dart';

class OurText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final Color color;
  final bool isLargeText;
  final TextDecoration decoration;
  final EdgeInsets padding;
  final int maxLines;

  const OurText(this.text,
      {Key key,
      this.textAlign = TextAlign.right,
      this.fontFamily = 'iranSans',
      this.fontWeight = FontWeight.bold,
      this.fontSize = 14,
      this.height = 2,
      this.isLargeText = true,
      this.padding = EdgeInsets.zero,
      this.decoration = TextDecoration.none,
      this.maxLines,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: textAlign,
        overflow: TextOverflow.fade,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          decoration: decoration,
          fontFamily: fontFamily,
          height: height,
        ),
      ),
    );
  }
}
