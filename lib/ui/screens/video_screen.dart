import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:school_erp/ui/screens/video_play.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  bool showVideoController = false;
  late VideoPlayerController controller;
  late VideoPlayerController controller2;
  ChewieController? chewieController;
  ChewieController? chewieController2;
  List<Uint8List?> thumbnails = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //addvideourl();
  }

  void loadThumbnails() async {
    for (int i = 0; i < videoUrls.length; i++) {
      try {
        final thumb = await VideoThumbnail.thumbnailData(video: videoUrls[i]);
        setState(() {
          thumbnails[i] = thumb; // update at index
        });
        // thumbnails[i] = thumb; // update at index
      } catch (e) {
        thumbnails[i] = null; // error case
      }

      setState(() {}); // update UI
    }
  }

  List<String> videoUrls = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://www.shutterstock.com/shutterstock/videos/3463346445/preview/stock-footage-beautiful-nature-video-ultra-hd.webm",
    "https://media.istockphoto.com/id/1455772765/video/waterfall-with-fresh-water-in-the-romantic-and-idyllic-tropical-jungle-rainforest-blue.mp4?s=mp4-640x640-is&k=20&c=-ufHs0M4TG0HCyntsf3RwpHP08EEtAlSv8APcZe6Ciw=",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://cdn.pixabay.com/video/2024/12/10/246151_large.mp",
    "https://cdn.pixabay.com/video/2024/08/30/228847_large.mp4",
    "https://www.shutterstock.com/shutterstock/videos/10056698/preview/stock-footage-aerial-united-kingdom-above-the-clouds-over-dorset-maiden-castle-from-above-the-clouds.webm",
    "https://cdn.pixabay.com/video/2024/12/10/246151_large.mp4",
  ];

  //

  List<Map<String, String>> videoList = [
    {
      "video":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      "thumbnail":
          "https://images.unsplash.com/photo-1504208434309-cb69f4fe52b0?w=800",
    },
    {
      "video":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      "thumbnail":
          "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=800",
    },
    {
      "video":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      "thumbnail":
          "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=800",
    },
  ];

  //
  int? playing;

  Map<String, Uint8List?> cache = {};

  Future<Uint8List?> getThumbnail(String url) async {
    if (cache.containsKey(url)) {
      return cache[url];
    }

    try {
      final data = await VideoThumbnail.thumbnailData(
        video: url,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 200,
        quality: 75,
      ).timeout(Duration(seconds: 5));

      cache[url] = data; // ✅ save in cache
      return data;
    } catch (e) {
      debugPrint("errro $e");
      cache[url] = null; // save error also
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Video Player"),

      body: Column(
        children: [
          SizedBox(
            height: 200,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videoUrls.length,
              itemBuilder: (context, index) {
                String url = videoUrls[index];

                return FutureBuilder<Uint8List?>(
                  future: getThumbnail(url),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: 120,
                        width: 120,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError || snapshot.data == null) {
                      return Stack(
                        alignment: AlignmentGeometry.center,

                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),

                            alignment: Alignment.center,
                            child: Text("Not Found"),
                          ),
                        ],
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: Text(
                          "Loading...",
                        ), // better than infinite spinner
                      );
                    }
                    return Stack(
                      alignment: AlignmentGeometry.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(8),
                          height: 120,
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Image.memory(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlay(url: videoUrls[index]),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: videoList.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: CachedNetworkImage(
                        imageUrl: videoList[index]["thumbnail"] ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlay(
                              url: videoList[index]["video"].toString(),
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
