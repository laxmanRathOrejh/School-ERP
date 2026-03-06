import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const NextButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B6FD8),
              foregroundColor: const Color(0xFFFDFCFC),
              shape: const BeveledRectangleBorder(),
            ),
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(text), const Icon(Icons.navigate_next_rounded)],
            ),
          ),
        ),
      ],
    );
  }
}
