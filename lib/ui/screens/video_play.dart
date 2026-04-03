import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  final String url;
  const VideoPlay({super.key, required this.url});

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late VideoPlayerController videoContrller;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    getvideo();
  }

  void getvideo() async {
    videoContrller = VideoPlayerController.networkUrl(Uri.parse(widget.url));

    await videoContrller.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoContrller,
      looping: true,
      autoPlay: true,
      //  overlay: Container(color: Colors.transparent),
      placeholder: Container(color: Colors.transparent),

      //  allowFullScreen: true,
      //  fullScreenByDefault: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    videoContrller.dispose();
    chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Video Player"),
      body: chewieController != null && videoContrller.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoContrller.value.aspectRatio,

              child: Chewie(controller: chewieController!),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

// Container(
//   width: double.infinity,
//   child: FittedBox(
//     fit: BoxFit.cover, // or BoxFit.contain if you want black bars
//     child: SizedBox(
//       width: videoController.value.size.width,
//       height: videoController.value.size.height,
//       child: Chewie(controller: chewieController!),
//     ),
//   ),
// )
