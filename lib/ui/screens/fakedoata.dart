import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/curriculum_provider.dart';

class Fakedata extends StatefulWidget {
  const Fakedata({super.key});

  @override
  State<Fakedata> createState() => _FakedataState();
}

class _FakedataState extends State<Fakedata> {
  List<Map<String, dynamic>> data = [
    {
      "type": "image",
      "path":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4JVlhhjx2M8Ku4oSuGnnY4g9ZrpgO7kIUh6JsaJb1hw&s ",
    },
    {
      "type": "image",
      "path":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4JVlhhjx2M8Ku4oSuGnnY4g9ZrpgO7kIUh6JsaJb1hw&s ",
    },
    {"type": "pdf", "path": "xyz"},
    {"type": "pdf", "path": "abc"},
    {"type": "video", "path": "new video"},
    {"type": "word", "path": "new word doqument"},
  ];
  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     context.read<CurriculumProvider>().getCurriculum(context: context);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CurriculumProvider>(context, listen: false);
    // var curriculumProvider = Provider.of<CurriculumProvider>(
    //  context,
     // listen: true,
    //);
    var attachment = data.noticeModel?.classNotice?[0].attachments;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ...(attachment ?? []).map((itam) {
              String fullurl = "${data.noticeModel?.asseetUrl}${itam.filePath}";
              switch (itam.type) {
                case "image":
                  return Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.all(5),
                    child: CachedNetworkImage(
                      imageUrl: fullurl ,
                      fit: BoxFit.cover,
                    ),
                  );
                // case "pdf":
                // return Text(itam["path"]);
                default:
                  return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
