import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:school_erp/service/permisan.dart';
import 'package:record/record.dart';
import 'dart:io';

import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/dialog/message_dialog.dart'
    show showMessageBox;

class RecoddeAudio extends StatefulWidget {
  const RecoddeAudio({super.key});

  @override
  State<RecoddeAudio> createState() => _RecoddeAudioState();
}

class _RecoddeAudioState extends State<RecoddeAudio> {
  bool hasPermisan = false;
  final player = AudioPlayer();

  // bool isPlaying = false;
  bool isRecoding = false;
  String filePath = "";
  List<String?> recordings = [];

  Future<String> getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/recording_${recordings.length}.m4a';
  }

  final record = AudioRecorder();

  Future<void> startRecording() async {
    if (await record.hasPermission()) {
      filePath = await getFilePath();
      await record.start(const RecordConfig(), path: filePath);
      setState(() => isRecoding = true);
    } else {
      // Permission denied, show UI message
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Permission denied')));
    }
  }

  Future<void> stopRecording() async {
    if (isRecoding) {
      final path = await record.stop();
      if (path != null) {
        recordings.add(path);
      }
      setState(() => isRecoding = false);
    } else {
      null;
    }
  }

  String? currentPlaying;
  Future<void> playAudio({required String path}) async {
    //if (filePath.isEmpty || !File(filePath).existsSync()) return;

    if (currentPlaying == path) {
      await player.stop();
      setState(() {
        // isPlaying = false;
        currentPlaying = null;
      });
      return;
    }

    if (!File(path).existsSync()) return;

    await player.stop();

    await player.setFilePath(path);
    await player.play();

    
    setState(() {
      // isPlaying = true;
      currentPlaying = path;
    });
  }

  Future<void> stopAudio() async {
    await player.stop();
    // setState(() => isPlaying = false);
  }

  @override
  void dispose() {
    record.dispose();
    super.dispose();
  }

  void chekPermisan() async {
    hasPermisan = await AppPermissions.checkMicrophonePermission();
    if (hasPermisan) {
      setState(() {
        hasPermisan = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    chekPermisan();
    loadRecordings();
    player.playerStateStream.listen((state) {
      final isCompleted = state.processingState == ProcessingState.completed;

      if (mounted) {
        setState(() {
          // isPlaying = state.playing;

          if (isCompleted) {
            debugPrint("complete audio here $isCompleted");
            currentPlaying = null; // 🔥 reset when finished
            // isPlaying = false;
          }
        });
      }
    });

    ///
  }

  Future<void> loadRecordings() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync().where((f) => f.path.endsWith('.m4a'));
    recordings = files.map((f) => f.path).toList();
    setState(() {});
  }

  Future<void> deleteRecording(String path) async {
    final file = File(path);

    if (await file.exists()) {
      await file.delete(); // deletes the file from storage
      recordings.remove(path); // remove from your list
      setState(() {}); // update UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Recording"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              //reverse: true,
              itemCount: recordings.length,
              itemBuilder: (ctx, index) {
                final file = recordings[index];
                return ListTile(
                  key: ValueKey(file),
                  title: Text(file!.split('/').last),
                  trailing: SizedBox(
                    width: 130,
                    child: Row(
                      children: [
                        IconButton(
                          icon: currentPlaying == file
                              ? Icon(Icons.pause)
                              : Icon(Icons.play_arrow),
                          //                      currentPlaying == file && isPlaying
                          // ? Icons.pause
                          // : Icons.play_arrow,
                          onPressed: () => playAudio(path: file),
                          //async {
                          //   if (file.isEmpty) return;
                          //   await playAudio(path: file);
                          // await deleteRecording(file);
                          //  await player.setFilePath(file);
                          //   player.play();
                          //  },
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () async {
                            await deleteRecording(file);
                            if (!context.mounted) return;

                            showMessageBox(
                              context: context,
                              text: "Delete Recording Sucessfully",
                            );
                          },
                          icon: Icon(Icons.delete, color: Color(0xFFD33F3F)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: isRecoding ? stopRecording : startRecording,
        icon: isRecoding
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
