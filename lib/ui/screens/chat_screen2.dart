import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/chat_provider.dart';
import 'package:school_erp/controlar/teacher_list_provider.dart';
import 'package:school_erp/ui/widgets/dialog/image_dialog.dart';

class ChatScreen2 extends StatefulWidget {
  final int? teacherid;
  final String? name;
  final String? profilePic;
  const ChatScreen2({super.key, this.teacherid, this.name, this.profilePic});

  @override
  State<ChatScreen2> createState() => _ChatScreen2State();
}

class _ChatScreen2State extends State<ChatScreen2> {
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatDataProvider>().getChatHistory(
        context: context,
        teacherId: widget.teacherid ?? 0,
      );
      // for scoll to last chat
    });
  }

  @override
  Widget build(BuildContext context) {
    var teacherChatProvider = Provider.of<ChatDataProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: widget.profilePic?.isNotEmpty ?? false
                  ? InkWell(
                      onTap: () {
                        showImageDialog(
                          context: context,
                          imagePath:
                              widget.profilePic ?? "assets/image/image_not.png",
                          isAssetskImage: widget.profilePic!.isNotEmpty
                              ? false
                              : true,
                        );
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                          widget.profilePic ?? "",
                        ),
                        backgroundColor: Color(0xffffffff),
                      ),
                    )
                  : CircleAvatar(
                      radius: 25,

                      backgroundColor: Color(0xffffffff),
                    ),
            ),
            SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ],
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
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatDataProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  controller: value.scrollController,
                  padding: EdgeInsets.only(top: 30, bottom: 80),
                  //length of message
                  itemCount:
                      teacherChatProvider.chatModel?.chatData?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment:
                              value.chatModel?.chatData?[index].chatStatus == 0
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,

                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      value
                                              .chatModel
                                              ?.chatData?[index]
                                              .chatStatus ==
                                          0
                                      ? Color(0xfff3f3f3)
                                      : Color(0xFF337ce2),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        top: 8,
                                        right: 4,
                                      ),
                                      child: Text(
                                        value
                                                .chatModel
                                                ?.chatData?[index]
                                                .message ??
                                            "",

                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              value
                                                      .chatModel
                                                      ?.chatData?[index]
                                                      .chatStatus ==
                                                  0
                                              ? Color(0xff000000)
                                              : Color(0xffffffff),
                                        ),
                                        softWrap: true,
                                      ),
                                    ),

                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            value
                                                    .chatModel
                                                    ?.chatData?[index]
                                                    .time ??
                                                "",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  value
                                                          .chatModel
                                                          ?.chatData?[index]
                                                          .chatStatus ==
                                                      0
                                                  ? Color(0xff000000)
                                                  : Color(0xFFF8F9FA),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          ///
          ///
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            child: TextFormField(
              onChanged: (value) {
                //   teacherChatProvider.
                teacherChatProvider.scrollToBottom();
              },
              controller: messageController,
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff0f0f0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff0f0f0)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff0f0f0)),
                ),

                fillColor: Color(0xfff0f0f0),
                hintText: "Message",
                suffixIcon: IconButton(
                  onPressed: () {
                    // messageController.clear();
                    teacherChatProvider.sendMessage(
                      message: {
                        "teacher_id": widget.teacherid,
                        "message": messageController.text,
                      },
                      context: context,
                    );
                    messageController.clear();
                  },
                  icon: Icon(Icons.send, color: Color(0xFF337ce2)),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
