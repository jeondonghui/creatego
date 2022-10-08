import 'package:flutter/material.dart';

class SizedTextDark extends StatelessWidget {
  double? width;
  double? height;
  AlignmentGeometry? alignment;
  String? text;
  TextStyle? textStyle;
  bool? useLocaleText;
  TextOverflow? overflow;
  TextAlign? textAlign;
  int? maxLines;

  SizedTextDark({
    required this.text,
    this.width,
    this.height,
    this.alignment,
    this.textStyle,
    this.useLocaleText,
    this.overflow,
    this.textAlign,
    this.maxLines,
  }) {
    useLocaleText ??= true;
    overflow ??= TextOverflow.visible;
    textAlign ??= TextAlign.left;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      child: Text(
        text!,
        style: textStyle ??
            const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "MaitreeRegular"),
        overflow: overflow,
        textAlign: textAlign,
        softWrap: true,
        maxLines: maxLines,
      ),
    );
  }
}
