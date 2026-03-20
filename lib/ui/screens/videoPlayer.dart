import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SimpleVideo extends StatefulWidget {
  const SimpleVideo({super.key});
  @override
  _SimpleVideoState createState() => _SimpleVideoState();
}

class _SimpleVideoState extends State<SimpleVideo> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller =
        VideoPlayerController.networkUrl(
            Uri.parse(
              "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            ),
          )
          ..initialize().then((_) {
            setState(() {}); // refresh UI
          });
  }

  @override
  void dispose() {
    controller.dispose(); // free memory
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Video")),
      body: Center(
        child: controller.value.isInitialized
            ? Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(border: Border()),
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller.value.isPlaying ? controller.pause() : controller.play();
          });
        },
        child: Icon(
          controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
