import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? space, height;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String muli;
  final bool isMax, style;
  const CustomTitleText(
      {super.key,
      this.text = '',
      this.muli = "Muli",
      this.fontSize = 16,
      this.color = Colors.black45,
      this.fontWeight = FontWeight.normal,
      this.space = 0.5,
      this.height = 1.5,
      this.isMax = false,
      this.style = false,
      this.textAlign = TextAlign.start});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.clip,
      maxLines: isMax ? 2 : 4,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: muli,
          height: height,
          letterSpacing: space,
          decoration: style ? TextDecoration.underline : TextDecoration.none),
    );
  }
}
