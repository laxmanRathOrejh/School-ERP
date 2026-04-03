import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/video_provider.dart';
import 'package:school_erp/ui/screens/video_play.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoScreenDegin extends StatefulWidget {
  const VideoScreenDegin({super.key});

  @override
  State<VideoScreenDegin> createState() => _VideoScreenDeginState();
}

class _VideoScreenDeginState extends State<VideoScreenDegin> {
  @override
  void initState() {
    super.initState();
    Provider.of<VideoProvider>(context, listen: false).indexForThum();
  }

  @override
  Widget build(BuildContext context) {
    var videoProvider = Provider.of<VideoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Videos"),
      body: ListView.builder(
        itemCount: videoProvider.videoData.length,
        itemBuilder: (context, index) {
          var videoItam = videoProvider.videoData[index];

          if (videoItam["thumbNail"] == null ||
              videoItam["thumbNail"].toString().isEmpty) {
            videoProvider.getThumbnail(
              videoUrl: videoItam["video"],
              index: index,
            );
          }
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlay(url: videoItam["video"]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentGeometry.bottomRight,
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Consumer<VideoProvider>(
                          builder: (context, value, child) {
                            final localThumbnail = value.thumbnailPath?[index];
                            final serverThunbnnail = videoItam["thumbNail"];
                            return ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              child:
                                  serverThunbnnail != null &&
                                      serverThunbnnail != ""
                                  ? CachedNetworkImage(
                                      imageUrl: videoItam["thumbNail"],
                                      fit: BoxFit.cover,
                                    )
                                  : localThumbnail != null
                                  ? Image.file(
                                      File(localThumbnail),
                                      fit: BoxFit.cover,
                                    )
                                  : Center(child: Text("No ThumbNail")),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, bottom: 5),
                        child: Text(
                          videoProvider.videoData[index]["videoDursain"],
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffffffff),
                            backgroundColor: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(videoItam["title"]),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundImage: CachedNetworkImageProvider(
                                  videoItam["logo"],
                                ),
                              ),
                              SizedBox(width: 10),

                              Text(
                                "Uploded  ${videoItam["uploddTime"]} ago",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );

          // return Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) =>
          //               VideoPlay(url: videoData[index]["video"]),
          //         ),
          //       );
          //     },
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Stack(
          //           alignment: AlignmentGeometry.bottomRight,
          //           children: [
          //             Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //               ),
          //               height: 250,
          //               width: double.infinity,
          //               child: ClipRRect(
          //                 borderRadius: BorderRadius.circular(20),

          //                 child: CachedNetworkImage(
          //                   imageUrl: videoData[index]["thumbNail"],
          //                   fit: BoxFit.fill,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(right: 10, bottom: 10),
          //               child: Text(
          //                 videoData[index]["videoDursain"],
          //                 style: TextStyle(
          //                   color: Color(0xffffffff),
          //                   backgroundColor: Color(0xff000000),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         SizedBox(height: 10),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             children: [
          //               Container(
          //                 height: 40,
          //                 width: 40,
          //                 decoration: BoxDecoration(shape: BoxShape.circle),
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadiusGeometry.circular(20),
          //                   child: CachedNetworkImage(
          //                     imageUrl: videoData[index]["logo"],
          //                     fit: BoxFit.fill,
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(width: 20),
          //               Flexible(child: Text(videoData[index]["title"])),
          //             ],
          //           ),
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: [
          //             Text(
          //               " Uploded ${videoData[index]["uploddTime"]} ago",
          //               style: TextStyle(color: Color(0xFF9B9A9A)),
          //             ),
          //             SizedBox(width: 5),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
