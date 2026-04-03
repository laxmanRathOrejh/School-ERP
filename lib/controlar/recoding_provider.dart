import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart' show AudioRecorder, RecordConfig;
import 'package:just_audio/just_audio.dart';

class RecodingProvider extends ChangeNotifier {
  List<String> recoding = [];
  List<Duration> durastion = [];
  bool isRecoding = false;
  final recoder = AudioRecorder();
  //for get mobil safe folder location
  Future<String> getPath() async {
    final dir = await getApplicationDocumentsDirectory();

    final now = DateTime.now();
    final formatted =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_"
        "${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}-${now.second.toString().padLeft(2, '0')}";

    return "${dir.path}/Recording_$formatted.m4a";

    //
  }

  //for Start recoding
  void startRecoding() async {
    debugPrint("Recoding Start here");
    if (isRecoding) return;
    String recodingPath = await getPath();
    recoder.start(RecordConfig(), path: recodingPath);
    isRecoding = true;
    notifyListeners();
  }

  //for Stop Recoding
  void stopRecoding() async {
    debugPrint("Recoding Stope here");

    final recodePath = await recoder.stop();
    if (recodePath != null) {
      recoding.add(recodePath);
      final time = await getRecordingDuration(recodePath);
      durastion.add(time!);
      isRecoding = false;
      print("here is duration${durastion[0]}");
      notifyListeners();
    }
  }

  // Fatch old recoding 
  Future<void> loadRecordings() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync().where((f) => f.path.endsWith('.m4a'));
    recoding = files.map((f) => f.path).toList();
    notifyListeners();
  }

  final audioPlayer = AudioPlayer();

  Future<Duration?> getRecordingDuration(String filePath) async {
    try {
      await audioPlayer.setFilePath(filePath); // load the audio file
      return audioPlayer.duration; // get its duration
    } catch (e) {
      print("Error getting duration: $e");
      return null;
    }
  }

  // Future<Duration?> getRecodingDuration({required String filePath}) async {
  //   try{
  //   await audioPlayer.setFilePath(filePath);
  //   return audioPlayer.duration;
  //   }catch(e){

  //   }finally{
  //          await player.dispose();

  //   }
  // }

  // Future<Duration?> getRecordingDuration(String filePath) async {
  //   final player = AudioPlayer();
  //   try {
  //     await player.setFilePath(filePath);
  //     return player.duration;
  //   } catch (e) {
  //     print("Error getting duration for $filePath: $e");
  //     return null;
  //   } finally {
  //     await player.dispose();
  //   }
  // }
}
