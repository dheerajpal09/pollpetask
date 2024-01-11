import 'package:flutter/material.dart';

class TitleTextStyle extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxline;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  const TitleTextStyle({
    super.key,
    this.style,
    this.textAlign,
    this.maxline,
    this.textOverflow,
    required this.text,
    this.textDirection,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxline,
      overflow: textOverflow,
      textDirection: textDirection,
    );
  }
}
