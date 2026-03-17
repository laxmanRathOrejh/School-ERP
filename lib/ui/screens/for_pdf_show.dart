import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:school_erp/ui/screens/show_full_pdf.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowPdf extends StatefulWidget {
  const ShowPdf({super.key});

  @override
  State<ShowPdf> createState() => _ShowPdfState();
}

class _ShowPdfState extends State<ShowPdf> {
  List<File>? fileFromMemory = [];

  void addFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );
    if (result != null) {
      setState(() {
        fileFromMemory!.addAll(
          result.paths.map((path) => File(path!)).toList(),
        );
        //File(result.files.single.path!);
      });
    }
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Show Pdf"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: fileFromMemory!.isEmpty
                ? Center(child: Text("No Pdf is selected "))
                : ListView.builder(
                    itemCount: fileFromMemory!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ShowFullPdf(pdfdata: fileFromMemory![index]),
                            ),
                          );
                          //print(fileFromMemory![index].path);
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red,
                          ),
                          title: Text(
                            fileFromMemory![index].path.split('/').last,
                          ),
                        ),
                      );
                    },
                  ),

            //          leading: Icon(Icons.picture_as_pdf, color: Colors.red),
            // title: Text(fileFromMemory[index].path.split('/').last),
            //            PageView.builder(
            //               itemCount: fileFromMemory!.length,
            //               scrollDirection: Axis.vertical,
            //               itemBuilder: (context, index) {
            //                 return SfPdfViewer.file(fileFromMemory![index]);
            //               },
            //             ),
            // : ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     itemCount: fileFromMemory!.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         height: MediaQuery.of(context).size.height / 2,
            //         margin: EdgeInsets.all(8),
            //         child: SfPdfViewer.file(fileFromMemory![index]),
            //       );
            //     },
            //   ),
          ),
          ElevatedButton(
            onPressed: () {
              addFile();
            },
            child: Text("Add image"),
          ),
        ],
      ),
    );
  }
}
