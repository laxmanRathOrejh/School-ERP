
import 'package:flutter/material.dart';

class StudentInfmoWidget extends StatelessWidget {
  final String firstText;
  final String lastText;

  const StudentInfmoWidget({
    super.key,
    required this.firstText,
    required this.lastText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: Text(firstText)),
        Text(lastText, style: TextStyle(color: Color(0xff4d97c7))),
      ],
    );
  }
}
