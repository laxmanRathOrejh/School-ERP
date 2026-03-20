import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';

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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //        // ShowFullPdf(pdfdata: fileFromMemory![index]),
                          //   ),
                          // );
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
