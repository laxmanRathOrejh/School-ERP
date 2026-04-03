import 'dart:async';

import 'package:flutter/material.dart';
import 'package:school_erp/ui/screens/calendar_screen.dart';
import 'package:school_erp/ui/screens/contact_screen.dart';
import 'package:school_erp/ui/screens/curriculum_screen.dart';
import 'package:school_erp/ui/screens/fess_screen.dart';
import 'package:school_erp/ui/screens/multi_select_fild.dart';
import 'package:school_erp/ui/screens/new_recoding.dart';
import 'package:school_erp/ui/screens/parent_detail_screen.dart';
import 'package:school_erp/ui/screens/pt_chat_screen.dart';
import 'package:school_erp/ui/screens/recodde_audio.dart'
    show AudioApp, RecoddeAudio;
import 'package:school_erp/ui/screens/recode_audio.dart';
import 'package:school_erp/ui/screens/student_mark_screen.dart';
import 'package:school_erp/ui/screens/video_screen.dart';
import 'package:school_erp/ui/screens/video_screen_degin.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/dialog/image_dialog.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List screenNameList = ["Calendar", "Contact", "Attendance"];

  //List<dynamic> allScreenData = [];

  List<Map<String, dynamic>> dashbordItam = [
    {
      "color": Color(0xffeee1fc),
      "image": "assets/image/calendar.png",
      "lable": "Calendar",
      "route": CalanderScreen()
      //VideoScreen(),
      // CalanderScreen(),
      //SimpleVideo()
      //hatScreen(),
      //CalanderScreen(),
    },
    {
      "color": Color(0xffddf9d8),
      "image": "assets/image/fess.png",
      "lable": "Fees",
      "route":       FessScreen(fromBottomNav: false, forFessHistory: false),

      //RecodeAudio()
      //RecoddeAudio(),
      //FessScreen(fromBottomNav: false, forFessHistory: false),
    },
    {
      "color": Color(0xffd2e7fa),
      "image": "assets/image/grops.png",
      "lable": "Groups",
      "route":  PtChatsScreen(fromBottomNav: false),
      //NewRecoding(),
     
    },
    {
      "color": Color(0xffd9f4ff),
      "image": "assets/image/parents.png",
      "lable": "Parents",
      "route": ParentScreen()
     // VideoScreenDegin(),
      // ParentScreen(),
    },
    {
      "color": Color(0xfffbf1d3),
      "image": "assets/image/cantact.png",
      "lable": "Contact",
      "route": ContactScreen(),
    },
    {
      "color": Color(0xfffce1e5),
      "image": "assets/image/curriculum.png",
      "lable": "Curriculum",
      "route": //ShowPdf(),
      CurriculumScreen(
        fromBottomNav: false,
      ),
    },
    {
      "color": Color(0xfff0f0f0),
      "image": "assets/image/timetable.png",
      "lable": "TimeTable",
      "route": FessScreen(fromBottomNav: false, forFessHistory: true),
    },
    {
      "color": Color(0xffd9f4ff),
      "image": "assets/image/fesshistry.png",
      "lable": "Fess History",
      "route": FessScreen(fromBottomNav: false, forFessHistory: true),
      //FissHistoryScreem(id: 1),
    },
    {
      "color": Color(0xffe0e3f3),
      "image": "assets/image/attendance.png",
      "lable": "Attendance",
      "route": StudentMarkScreen(),
      //MultiSelectExample(),
    },
  ];
  List<dynamic> allScreenData = [];


  @override
  Widget build(BuildContext context) {
    debugPrint("Screen Rebuild");
    return Scaffold(
      appBar: AppbarWidget(
        titleText: "Dashboard",
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                color: const Color(0xFFf3f3f3),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                            color: const Color(0xFF158DF0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 2.5,
                              top: 2.5,
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Scholar No. 112233",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: InkWell(
                            onTap: () {
                              showImageDialog(
                                context: context,
                                imagePath: "assets/image/user.png",
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xffbababa),
                              radius: 40,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                  child: Image.asset(
                                    "assets/image/user.png",
                                    fit: BoxFit.cover,
                                    scale: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Student Name",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xff337ce2),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Class -  X",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF7e7071),
                              ),
                            ),
                            SizedBox(height: 2),

                            Text(
                              "Home - Red",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF7e7071),
                              ),
                            ),
                            SizedBox(height: 2),

                            Text(
                              "Attendance - Not Marked",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF7e7071),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 30),

              GridView.builder(
                shrinkWrap: true,
                itemCount: dashbordItam.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 20, right: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: .87,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => dashbordItam[index]["route"],
                        ),
                      );
                    },

                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: dashbordItam[index]["color"],
                          ),
                          child: Center(
                            child: Image.asset(
                              dashbordItam[index]["image"],
                              scale: 5,
                            ),
                          ),
                        ),
                        SizedBox(height: 9),
                        Text(
                          dashbordItam[index]["lable"],
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Wrap(
              //   children: [
              //     for (var map in dashbordItam)
              //       if (screenNameList.contains(map["lable"]))
              //         Padding(
              //           padding: const EdgeInsets.all(20.0),
              //           child: InkWell(
              //             onTap: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => map["route"],
              //                 ),
              //               );
              //             },
              //             child: Column(
              //               children: [
              //                 Container(
              //                   width: 80,
              //                   height: 80,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(15),
              //                     color: map["color"],
              //                   ),
              //                   child: Center(
              //                     child: Image.asset(map["image"], scale: 5),
              //                   ),
              //                 ),
              //                 SizedBox(height: 9),
              //                 Text(
              //                   map["lable"],
              //                   style: TextStyle(
              //                     fontSize: 11,
              //                     fontWeight: FontWeight.w700,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //   ],
              // ),

              //    itemCount: dashbordItam
              // .where((map) => screenNameList.contains(map["lable"]))
              // .length,
              //  var filtered = dashbordItam
              //  .where((map) => screenNameList.contains(map["lable"]))
              // .toList();
              // var map = filtered[index];
              // GridView.builder(

              //   itemCount: dashbordItam.length,
              //   // itemCount: dashbordItam
              //   //     .where((map) => screenNameList.contains(map["lable"]))
              //   //     .length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //   ),
              //   itemBuilder: (context, index) {
              //     // var filtered = dashbordItam
              //     //     .where((map) => screenNameList.contains(map["lable"]))
              //     //     .toList();
              //     // var map = filtered[index];
              //     return InkWell(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => dashbordItam[index]["route"],
              //           ),
              //         );
              //       },
              //       child: Column(
              //         children: [
              //           Container(
              //             width: 80,
              //             height: 80,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               color: dashbordItam[index]["color"],
              //             ),
              //             child: Center(
              //               child: Image.asset(
              //                 dashbordItam[index]["image"],
              //                 scale: 5,
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 9),
              //           Text(
              //             dashbordItam[index]["lable"],
              //             style: TextStyle(
              //               fontSize: 11,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),

              // GridView.count(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   padding: EdgeInsets.only(left: 20, right: 20),
              //   crossAxisCount: 3,
              //   crossAxisSpacing: 2,
              //   mainAxisSpacing: 2,
              //   childAspectRatio: .87,
              //   children: [
              //     for (var map in dashbordItam)
              //       if (screenNameList.contains(map["lable"]))
              //         InkWell(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => map["route"],
              //               ),
              //             );
              //           },
              //           child: Column(
              //             children: [
              //               Container(
              //                 width: 80,
              //                 height: 80,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(15),
              //                   color: map["color"],
              //                 ),
              //                 child: Center(
              //                   child: Image.asset(map["image"], scale: 5),
              //                 ),
              //               ),
              //               SizedBox(height: 9),
              //               Text(
              //                 map["lable"],
              //                 style: TextStyle(
              //                   fontSize: 11,
              //                   fontWeight: FontWeight.w700,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //   ],
              // ),

              // var newScreenList = dashbordItam
              //     .where((n) => n["lable"] == screenNameList)
              //     .toList();
              // print("here is new list dara $newScreenList");
              // var screenData = dashbordItam
              //     .where((itam) => itam["lable"] == screenNameList[index])
              //     .toList();
              // for (int i = 1; i < dashbordItam.length; i++) {

              // }
              // for (int j = 0; j < screenNameList.length; j++) {
              // //  if (dashbordItam.contains(screenNameList[j])) {
              //     print(screenNameList[j]);
              //     allScreenData.add(screenNameList[j]);
              //   }
              //   debugPrint(allScreenData.toString());
              // }
              // var allScreen = dashbordItam[index];

              // if (screenNameList.contains(allScreen["lable"])) {
              //  return

              //   for (var map in dashbordItam)
              //     if (screenNameList.contains(map["lable"]))
              //     InkWell(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => dashbordItam[index]["route"],
              //           ),
              //         );
              //       },
              //       child: Column(
              //         children: [
              //           Container(
              //             width: 80,
              //             height: 80,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               color: dashbordItam[index]["color"],
              //             ),
              //             child: Center(
              //               child: Image.asset(allScreen["image"], scale: 5),
              //             ),
              //           ),
              //           SizedBox(height: 9),
              //           Text(
              //             dashbordItam[index]["lable"],
              //             style: TextStyle(
              //               fontSize: 11,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   } else {
              //     return Container(
              //       height: 50,
              //       width: 50,
              //       color: Colors.amber,
              //     );
              //   }
              // },
            ],
          ),
        ],
      ),
    );
  }
}
