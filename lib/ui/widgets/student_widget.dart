import 'package:flutter/material.dart';

class StudentInfmoWidget extends StatelessWidget {
  final String firstText;
  final String lastText;
  final double? fontSize;

  const StudentInfmoWidget({
    super.key,
    this.fontSize = 14,
    required this.firstText,
    required this.lastText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: Text(firstText,style: TextStyle(fontSize: fontSize),)),
        Text(lastText, style: TextStyle(color: Color(0xff4d97c7),fontSize: fontSize)),
      ],
    );
  }
}
