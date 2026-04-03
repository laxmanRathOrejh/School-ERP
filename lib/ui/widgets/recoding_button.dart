import 'package:flutter/material.dart';

class AnimatedRecordButton extends StatefulWidget {
  final bool isRecording;
  final VoidCallback startRecoding;
    final VoidCallback stopRecoding;


  const AnimatedRecordButton({
    super.key,
    required this.startRecoding,
    required this.isRecording,
    required this.stopRecoding,
  });

  @override
  State<AnimatedRecordButton> createState() => _AnimatedRecordButtonState();
}

class _AnimatedRecordButtonState extends State<AnimatedRecordButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      lowerBound: 0.0,
      upperBound: 0.15, // pulsing scale
    );

    if (widget.isRecording) _controller.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(covariant AnimatedRecordButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRecording) {
      _controller.repeat(reverse: true);
    } else {
      _controller.stop();
      _controller.value = 0.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.isRecording? widget.startRecoding:widget.stopRecoding,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double scale = 1 + _controller.value;
          return Transform.scale(
            scale: scale,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: widget.isRecording ? Colors.red : Colors.grey[800],
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.isRecording ? Icons.stop : Icons.mic,
                color: Colors.white,
                size: 35,
              ),
            ),
          );
        },
      ),
    );
  }
}