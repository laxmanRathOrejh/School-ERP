import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/chat_provider.dart';
import 'package:school_erp/controlar/local_list_update.dart';

class ChatScreen extends StatefulWidget {
  final Map<String, dynamic>? teacherid;
  final String? name;
  final String? profilePic;
  const ChatScreen({super.key, this.teacherid, this.name, this.profilePic});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocalListUpdate>().chatHistory;
      // context.read<ChatDataProvider>().getChatHistory(
      //   context: context,
      //   teacherId: widget.teacherid ?? {},
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    var localListProvider = Provider.of<LocalListUpdate>(
      context,
      listen: false,
    );

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<ChatDataProvider>(
          builder: (context, value, child) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: widget.profilePic?.isNotEmpty ?? false
                      ? CircleAvatar(
                          radius: 25,
                          backgroundImage: CachedNetworkImageProvider(
                            widget.profilePic ?? "",
                          ),
                          backgroundColor: Color(0xffffffff),
                        )
                      : CircleAvatar(
                          radius: 25,

                          backgroundColor: Color(0xffffffff),
                        ),
                ),
                SizedBox(width: 10),

                Consumer<LocalListUpdate>(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
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
      body: Consumer<LocalListUpdate>(
        builder: (context, value, child) {
          return Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.only(top: 30, bottom: 80),
                //length of message
                itemCount: value.chatHistory.length,
                itemBuilder: (context, index) {
                  bool isStudent = value.chatHistory[index]["status"] == 0;
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                      // right: value.chatModel?.chatData?[index].chatStatus == 0
                      //     ? 10
                      //     : 50,
                      // left: value.chatModel?.chatData?[index].chatStatus == 0
                      //     ? 50
                      //     : 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: isStudent
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minHeight: 50,
                            //  maxWidth: MediaQuery.of(context).size.width * 0.2,
                          ),
                          decoration: BoxDecoration(
                            color: isStudent
                                ? Color(0xfff3f3f3)
                                : Color(0xFF337ce2),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  value.chatHistory[index]["message"] ?? "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isStudent
                                        ? Color(0xff000000)
                                        : Color(0xffffffff),
                                  ),
                                  maxLines: 3,
                                ),
                              ),

                              Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 4,
                                      right: 4,
                                    ),
                                    child: Text(
                                      value.chatHistory[index]["time"] ?? "",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: isStudent
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
                      ],
                    ),
                  );
                },
              ),

              Positioned(
                bottom: 10,
                left: 0,
                right: 0,

                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
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
                          localListProvider.addNewChat(
                            message: messageController.text,
                          );
                          messageController.clear();
                        },
                        icon: Icon(Icons.send, color: Color(0xFF337ce2)),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
