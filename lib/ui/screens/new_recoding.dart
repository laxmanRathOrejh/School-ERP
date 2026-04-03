import 'package:flutter/material.dart';
import 'dart:io'; // 🔥 important

import 'package:http/http.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:school_erp/service/permisan.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';

class NewRecoding extends StatefulWidget {
  const NewRecoding({super.key});

  @override
  State<NewRecoding> createState() => _NewRecodingState();
}

class _NewRecodingState extends State<NewRecoding> {
  final recoding = AudioRecorder();
  bool recoderStart = false;
  final audiaPlayer = AudioPlayer();
  String? currentPath;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  List<String> recodingData = [];
  //for recoding audio
  void startRecoding() async {
    if (await recoding.hasPermission()) {
      await audiaPlayer.stop();

      String filePath = await getFilePath();
      await recoding.start(RecordConfig(), path: filePath);
      setState(() {
        recoderStart = true;
      });
    }
  }

  ///Stop Recoder from recoding audio
  void stopRecoding() async {
    final recodePath = await recoding.stop();
    if (recodePath != null) {
      recodingData.add(recodePath);
    }
    setState(() {
      recoderStart = false;
    });
  }

  //for get local strorage route
  Future<String> getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/recording_${recodingData.length}.m4a';
  }

  ///play audio from local stroge
  void playAudio({required String rcodinglocation}) async {
    if (currentPath == rcodinglocation && audiaPlayer.playing) {
      await audiaPlayer.pause();
      setState(() {});
    } else {
      await audiaPlayer.stop();
      await audiaPlayer.setFilePath(rcodinglocation);
      await audiaPlayer.play();
      setState(() {
        currentPath = rcodinglocation;
      });
    }
  }

  //get old Recoding from memory
  Future<void> loadRecordings() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync().where((f) => f.path.endsWith('.m4a'));
    recodingData = files.map((f) => f.path).toList();
    setState(() {});
  }

  //delete recoding from memory
  Future<void> deleteRecording(String path) async {
    final file = File(path);

    if (await file.exists()) {
      await file.delete(); // deletes the file from storage
      recodingData.remove(path); // remove from your list
      setState(() {}); // update UI
    }
  }

  void getAudioTrack() {
    //   audiaPlayer.positionStream.listen((p) {
    //   if (currentPath != null) {
    //     setState(() {
    //       position = p;
    //     });
    //   }
    // });
    audiaPlayer.positionStream.listen((p) {
      if (currentPath != null) {
        setState(() {
          position = p;
        });
      }
    });
    ////
    audiaPlayer.durationStream.listen((d) {
      if (d != null) {
        setState(() {
          duration = d;
        });
      }
    });
  }
  //formate time 
  String formatTime(Duration d) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(d.inMinutes);
  final seconds = twoDigits(d.inSeconds % 60);
  return "$minutes:$seconds";
}

  @override
  void initState() {
    super.initState();
    AppPermissions.checkMicrophonePermission();
    loadRecordings();
    getAudioTrack();
    audiaPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        currentPath = null;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    audiaPlayer.dispose();
    recoding.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Recoding Screen 2"),

      body: recodingData.isEmpty
          ? Center(child: Text("No Recoding Found"))
          : ListView.builder(
              itemCount: recodingData.length,
              itemBuilder: (context, index) {
                String recodingPath = recodingData[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(recodingPath.split("/").last),
                          IconButton(
                            onPressed: () {
                              playAudio(rcodinglocation: recodingPath);
                            },
                            icon: currentPath == recodingPath && audiaPlayer.playing
                                ? Icon(Icons.pause) // ✅ playing → pause
                                : Icon(Icons.play_arrow),
                          ),
                        ],
                      ),
                      ////
                      ///
           

    // 🎧 AUDIO TRACK (only for current playing item)
    if (currentPath == recodingPath)
      Column(
        children: [
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble() == 0
                ? 1
                : duration.inSeconds.toDouble(),
            value: position.inSeconds
                .clamp(0, duration.inSeconds)
                .toDouble(),
            onChanged: (value) async {
              await audiaPlayer.seek(
                Duration(seconds: value.toInt()),
              );
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatTime(position)),
              Text(formatTime(duration)),
            ],
          ),
        ],
      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: IconButton(
        onPressed: recoderStart ? stopRecoding : startRecoding,
        icon: recoderStart
            ? Icon(
                Icons.multitrack_audio_sharp,
                size: 50,
                color: const Color(0xFFA09E9E),
              )
            : Icon(Icons.play_arrow, size: 50, color: const Color(0xFF6F6F6F)),
      ),
    );
  }
}
