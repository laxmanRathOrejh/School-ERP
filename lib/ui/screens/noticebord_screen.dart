import 'package:flutter/material.dart';

class NoticBordScreen extends StatefulWidget {
  final dynamic provider;
  final dynamic mainProvider;
  //int? index;
  const NoticBordScreen({
    super.key,
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
              widget.provider.title ?? "",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.mainProvider.formatDate(
                      widget.provider?.createdAt ?? "",
                    ),
                    style: TextStyle(color: Color(0xffb5b5b5)),
                  ),
                ),
                Icon(Icons.link, color: Color(0xff8c8c8c)),

                Row(
                  children: [
                    Text(
                      widget.provider.attachments?.length.toString() ?? "",
                      style: TextStyle(fontSize: 12, color: Color(0xffbcbcbc)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              widget.provider.description ?? "",
              style: TextStyle(color: Color(0xff9e9e9e)),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: widget.provider?.attachments != null
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(Icons.link, color: Color(0xff8c8c8c)),
                        ),
                        Text(
                          widget.provider?.attachments.length.toString() ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffb5b5b5),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Attachment",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffb5b5b5),
                          ),
                        ),
                      ], //Image.file(File(image[index].path!)
                    )
                  : SizedBox(height: 10),
            ),
            SizedBox(height: 20),

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
