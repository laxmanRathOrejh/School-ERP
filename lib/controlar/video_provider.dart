import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoProvider extends ChangeNotifier {
  List? thumbnailPath;

  Future<void> getThumbnail({
    required String videoUrl,
    required int index,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    debugPrint("here is path ${dir.path}");

    final path = await VideoThumbnail.thumbnailFile(
      video: videoUrl,
      thumbnailPath: dir.path,
    );
    debugPrint("Here is$path");
    if (path != null) {
      thumbnailPath?[index] = path;
      notifyListeners();
    }
  }

  // list of video
  List<Map<String, dynamic>> videoData = [
    {
      "video":
          "https://media.istockphoto.com/id/1430945266/video/nature-sunrise-mountain-trees-and-aerial-view-of-the-forrest-and-beautiful-scenic-in-the.mp4?s=mp4-640x640-is&k=20&c=gosr3IBQvn0OV-RLrkaWEzLBeCulQ4QZILC4M5B9DcY=",

      "thumbNail": "",
      //   "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=800",
      "title": "Peaceful Morning in Nature Where Silence Feels Alive",
      "uploddTime": "2 month",
      "videoDursain": "00:11",
      "logo":
          "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
    },
    {
      "video":
          "https://media.istockphoto.com/id/1455772765/video/waterfall-with-fresh-water-in-the-romantic-and-idyllic-tropical-jungle-rainforest-blue.mp4?s=mp4-640x640-is&k=20&c=-ufHs0M4TG0HCyntsf3RwpHP08EEtAlSv8APcZe6Ciw=",
      "thumbNail": "",
      //    "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=800",
      "title": "Whispers of the Forest Calm Your Mind Naturally",
      "uploddTime": "9 month",
      "videoDursain": "00:21",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyB2U5310nGxhe8yrZ3g4gV1L5PR8UuGJOzA&s",
    },
    {
      "video":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      "thumbNail": "",
      //   "https://images.unsplash.com/photo-1504208434309-cb69f4fe52b0?w=800",
      "title": "Golden Sunset Views Nature at Its Best",
      "uploddTime": "3 hour",
      "videoDursain": "00:05",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyB2U5310nGxhe8yrZ3g4gV1L5PR8UuGJOzA&s",
    },
    {
      "video":
          "https://media.istockphoto.com/id/1455772765/video/waterfall-with-fresh-water-in-the-romantic-and-idyllic-tropical-jungle-rainforest-blue.mp4?s=mp4-640x640-is&k=20&c=-ufHs0M4TG0HCyntsf3RwpHP08EEtAlSv8APcZe6Ciw=",

      "thumbNail": "",
      //    "https://pictures.altai-travel.com/1160x0/mount-everest-nepal-istock-3746.jpg",
      "title": "Relaxing River Sounds Flow With the Moment",
      "uploddTime": "1 month",
      "videoDursain": "00:30",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbulv01lur73HEGmpMgCiLtPr_pe8SSvrh1g&s",
    },

    {
      "video":
          "https://www.shutterstock.com/shutterstock/videos/10056698/preview/stock-footage-aerial-united-kingdom-above-the-clouds-over-dorset-maiden-castle-from-above-the-clouds.webm",

      "thumbNail": "",
      //   "https://img.freepik.com/free-photo/sunset-snow-capped-mountains_23-2152014205.jpg?semt=ais_incoming&w=740&q=80",
      "title": "Into the Wild Beauty Feel the Fresh Air",
      "uploddTime": "1 year",
      "videoDursain": "00:44",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQiH4joN7_gwv-sndMrSy8Fl1F3FzM1ywaxw&s",
    },

    {
      "video":
          "https://media.istockphoto.com/id/1087164830/video/fresh-water-bubbling-from-source.mp4?s=mp4-640x640-is&k=20&c=bKZOg1eFyFujn-4wzgyALxmNsB8J4IeYg1KI01uwovc=",
      "thumbNail": "",
      // "https://img.freepik.com/free-photo/close-up-portrait-attractive-young-woman-isolated_273609-36523.jpg?semt=ais_hybrid&w=740&q=80",
      "title": "a hiddin gem near Surat ",
      "uploddTime": "8 month",
      "videoDursain": "01:00",
      "logo":
          "https://object.pixocial.com/pixocial/dmxffni837f1xrj8pki9xgrl.jpg",
    },
  ];

  // To give length to thumnail index
  void indexForThum() {
    thumbnailPath = List.filled(videoData.length, null);
  }
}
