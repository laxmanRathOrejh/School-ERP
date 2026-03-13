import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/teacher_list_provider.dart';
import 'package:school_erp/ui/screens/chat_screen.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';

class PtChatsScreen extends StatefulWidget {
  final bool fromBottomNav;

  const PtChatsScreen({super.key, required this.fromBottomNav});

  @override
  State<PtChatsScreen> createState() => _PtChatsScreenState();
}

class _PtChatsScreenState extends State<PtChatsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TeacherListProvider>().getTeacherList(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var teacherListProvider = Provider.of<TeacherListProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: widget.fromBottomNav
          ? AppbarWidget(titleText: "PT Chats")
          : AppbarWithBackWidget(titleText: "PT Chats"),

      body: Container(
        color: Color(0xffeeeeee),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Teacher List",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Consumer<TeacherListProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount:
                          teacherListProvider.teacherList?.teacherData?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () {
                              int teacherId =
                                  value
                                      .teacherList!
                                      .teacherData?[index]
                                      .teacherId ??
                                  0;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    name: value
                                        .teacherList
                                        ?.teacherData?[index]
                                        .teacherName,
                                    profilePic: value
                                        .teacherList
                                        ?.teacherData?[index]
                                        .profilPic,
                                    teacherid: {"teacher_id": teacherId},
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffffffff),
                                border: Border.all(color: Color(0xffffffff)),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      right: 12,
                                      top: 12,
                                      bottom: 12,
                                    ),
                                    child:
                                        value
                                                .teacherList
                                                ?.teacherData?[index]
                                                .profilPic !=
                                            null
                                        ? CircleAvatar(
                                            backgroundColor: Color(0xFF0515F5),
                                            radius: 30,
                                            child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Color(
                                                0xffbababa,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 7,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadiusGeometry.circular(
                                                        22,
                                                      ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        value
                                                            .teacherList
                                                            ?.teacherData?[index]
                                                            .profilPic ??
                                                        "",
                                                  ),
                                                ),
                                                // child: ClipRRect(
                                                //   borderRadius:
                                                //       BorderRadiusGeometry.circular(20),
                                                //   child: Icon(
                                                //     Icons.person,
                                                //     size: 58,
                                                //     color: Color(0xffffffff),
                                                //   ),
                                                // ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                  ),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Name ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            teacherListProvider
                                                    .teacherList
                                                    ?.teacherData?[index]
                                                    .teacherName
                                                    .toString() ??
                                                "",
                                            style: TextStyle(
                                              color: Color(0xffa3a3a3),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Designation",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            value
                                                    .teacherList
                                                    ?.teacherData?[index]
                                                    .designation ??
                                                "",
                                            style: TextStyle(
                                              color: Color(0xffa3a3a3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          size: 20,
                                          color: Color(0xffdcdcdc),
                                        ),
                                        SizedBox(width: 16),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
