import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:school_erp/ui/screens/show_full_pdf.dart';
import 'package:school_erp/ui/widgets/dialog/image_dialog.dart';

class NoticBordScreen extends StatefulWidget {
  final dynamic provider;
  final dynamic mainProvider;
  final int index;
  const NoticBordScreen({
    super.key,
    required this.index,
    required this.provider,
    required this.mainProvider,
  });

  @override
  State<NoticBordScreen> createState() => _NoticBordScreenState();
}

class _NoticBordScreenState extends State<NoticBordScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newProvider = widget.provider[widget.index];
    var attachment = newProvider?.attachments;

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notice Board",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        shadowColor: const Color(0xffffffff),
        backgroundColor: const Color(0xFFffffff),
        elevation: 0.1,
        leadingWidth: 45,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFe3e3e3),
            radius: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xffc1c1c1),
                size: 15,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newProvider.title ?? "",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              widget.mainProvider.formatDate(newProvider?.createdAt ?? ""),
              style: TextStyle(color: Color(0xffb5b5b5), fontSize: 12),
            ),
            SizedBox(height: 10),
            Text(
              newProvider.description ?? "",
              style: TextStyle(color: Color(0xff9e9e9e)),
            ),
            Divider(),
            // SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: newProvider?.attachments != null
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(Icons.link, color: Color(0xff8c8c8c)),
                        ),

                        SizedBox(width: 10),
                        Text(
                          "Attachment",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8C8C8C),
                          ),
                        ),
                      ], //Image.file(File(image[index].path!)
                    )
                  : SizedBox(height: 10),
            ),

            SizedBox(height: 20),
            SizedBox(
              // color: Colors.black,
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...(attachment ?? []).map((itam) {
                    String fullurl = Uri.encodeFull(
                      "${widget.mainProvider.noticeModel?.asseetUrl}${itam.filePath}",
                    );
                    switch (itam.type) {
                      case "video":
                        return SizedBox(width: 200, height: 200);
                      case "image":
                        return InkWell(
                          onTap: () {
                            showImageDialog(
                              isAssetskImage: false,
                              imagePath: fullurl,
                              context: context,
                            );
                          },
                          child: Container(
                            height: 130,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            margin: EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl: fullurl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );

                      //  case "pdf":
                      // return Text(itam["path"]);
                      default:
                        return SizedBox();
                    }
                  }),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                ...(attachment ?? []).map((itam) {
                  String fullurl = Uri.encodeFull(
                    "${widget.mainProvider.noticeModel?.asseetUrl}${itam.filePath}",
                  );
                  switch (itam.type) {
                    case "pdf":
                      return SizedBox(
                        // height: 50,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowFullPdf(pdfdata: fullurl),
                              ),
                            );
                            // ShowFullPdf(pdfdata: fullurl??"",);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFFa8b6d1),
                                  radius: 24,
                                  child: Icon(
                                    Icons.picture_as_pdf,
                                    size: 14,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "logisticdocx",
                                  // .path.split('/').last,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // child: ListTile(
                        //   leading: Icon(
                        //     Icons.picture_as_pdf,
                        //     color: Colors.red,
                        //   ),
                        //   title: Text(
                        //     fullurl,
                        //     // .path.split('/').last,
                        //   ),
                        // ),
                      );
                    default:
                      return SizedBox();
                  }
                }),
              ],
            ),
            /////////////////////////////////////

            // Column(
            //   children: [
            //     if (widget.provider.attachments[widget.index].type ==
            //         "image") ...[
            //       Container(
            //         height: 100,
            //         width: 100,
            //         child: CachedNetworkImage(
            //           imageUrl:
            //               widget.provider.attachments[widget.index].filePath ??
            //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4JVlhhjx2M8Ku4oSuGnnY4g9ZrpgO7kIUh6JsaJb1hw&s"//  "assets/image/attendance.png",
            //         ),
            //       ),
            //     ],
            //   ],
            // ),
            //  Column(
            //    children: [
            //     if (widget.provider.attachments[widget.index].type ==
            //         "image") ...[
            //       Text(
            //         widget.provider.attachments[widget.index].type.toString(),
            //       ),
            //       SizedBox(
            //         height: 200,
            //         width: 200,
            //         child: CachedNetworkImage(
            //           imageUrl:
            //               widget.provider.attachments[widget.index].filePath,
            //         ),
            //         //  cached_network_image
            //       ),
            //     ],
            //   ],
            // ),

            // Expanded(
            //   child: image.isEmpty
            //       ? const Center(child: Text("No images selected"))
            //       : ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: image.length,
            //           itemBuilder: (context, index) {
            //             return Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Container(
            //                 height: 200,
            //                 width: 100,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                   border: Border.all(color: Colors.blue, width: 2),
            //                 ),
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(8),
            //                   child: Image.file(
            //                     File(image[index].path!),
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     color: Color(0xffffffff),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color(0xfff1f1f1),
            //         blurRadius: 10,
            //         spreadRadius: 2,
            //         offset: Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 30, bottom: 20),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             SizedBox(width: 30),
            //             CircleAvatar(
            //               radius: 25,
            //               backgroundColor: Color(0xffcee5f3),
            //               child: Image.asset(
            //                 "assets/image/document.png",
            //                 scale: 25,
            //                 color: Color(0xff5cabe0),
            //               ),
            //             ),
            //             SizedBox(width: 54),
            //             CircleAvatar(
            //               radius: 25,
            //               backgroundColor: Color(0xfff5dae3),
            //               child: Image.asset(
            //                 "assets/image/document.png",
            //                 scale: 25,
            //                 color: Color(0xfff5545d),
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(height: 10),
            //         Row(
            //           children: [
            //             SizedBox(width: 20),
            //             Text(
            //               "logistic.docx",
            //               style: TextStyle(
            //                 fontSize: 10,
            //                 color: Color(0xff5cabe0),
            //               ),
            //             ),
            //             SizedBox(width: 30),
            //             Text(
            //               "logistic.pdf",
            //               style: TextStyle(
            //                 fontSize: 10,
            //                 color: Color(0xff95999c),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
