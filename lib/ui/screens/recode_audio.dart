import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/recoding_provider.dart';
import 'package:school_erp/service/permisan.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/recoding_button.dart';

class RecodeAudio extends StatefulWidget {
  const RecodeAudio({super.key});

  @override
  State<RecodeAudio> createState() => _RecodeAudioState();
}

class _RecodeAudioState extends State<RecodeAudio> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppPermissions.checkMicrophonePermission();
      context.read<RecodingProvider>().loadRecordings();
    });
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<RecodingProvider>(context, listen: false);
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "All Recoding"),
      body: Consumer<RecodingProvider>(
        builder: (context, value, child) {
          if (value.recoding.isEmpty) {
            return Center(child: Text("No Recoding Found "));
          }
          return Consumer<RecodingProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: audioProvider.recoding.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Icon(Icons.headphones, color: Colors.blue),
                        SizedBox(width: 10),
                        Text(audioProvider.recoding[index].split("/").last),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: Consumer<RecodingProvider>(
        builder: (context, value, child) {
          return IconButton(
            onPressed: () {
              if (audioProvider.isRecoding) {
                audioProvider.stopRecoding();
              } else {
                audioProvider.startRecoding();
              }
            },

            //
            icon: Icon(
              audioProvider.isRecoding ? Icons.stop : Icons.mic,
              color: const Color(0xFFF49595),
              size: 35,
            ),
          );
        },
      ),
    );
  }
}
