import 'package:flutter/material.dart';

///
/// ShadowedText
/// 
/// Simple widget that displays a text with its shadow
///
class ShadowedText extends StatelessWidget {
  ShadowedText({
    Key key,
    @required this.text,
    this.fontWeight: FontWeight.w400,
    this.fontSize: 16.0,
    this.letterSpacing,
    this.color: Colors.white,
    this.shadowColor: Colors.pink,
    this.offset: const Offset(1.0, 1.0),
    this.shadowOpacity: 1.0,
  }) : super(key: key);

  final String text;
  final FontWeight fontWeight;
  final Color color, shadowColor;
  final Offset offset;
  final double shadowOpacity;
  final double fontSize;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Transform.translate(
          offset: offset,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: shadowColor.withOpacity(shadowOpacity), fontWeight: fontWeight, letterSpacing: letterSpacing),
          )),
      Text(
        text,
        style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight, letterSpacing: letterSpacing),
      ),
    ]);
  }
}