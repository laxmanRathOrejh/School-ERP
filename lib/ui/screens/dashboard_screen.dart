import 'package:flutter/material.dart';
import 'package:school_erp/ui/screens/attendance_screen.dart';
import 'package:school_erp/ui/screens/calendar_screen.dart';
import 'package:school_erp/ui/screens/contact_screen.dart';
import 'package:school_erp/ui/screens/curriculum_screen.dart';
import 'package:school_erp/ui/screens/fess_history_screen.dart';
import 'package:school_erp/ui/screens/fess_payment_screen.dart';
import 'package:school_erp/ui/screens/parent_detail_screen.dart';
import 'package:school_erp/ui/screens/pt_chat_screen.dart';
import 'package:school_erp/ui/screens/try_fucute_bilder.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<Map<String, dynamic>> dashbordItam = [
    {
      "color": Color(0xffeee1fc),
      "image": "assets/image/calendar.png",
      "lable": "Calendar",
      "route": CalanderScreen(),
    },
    {
      "color": Color(0xffddf9d8),
      "image": "assets/image/fess.png",
      "lable": "Fees",

      "route": TryFucuterBilder(),
    },
    {
      "color": Color(0xffd2e7fa),
      "image": "assets/image/grops.png",
      "lable": "Groups",
      "route": PtChatsScreen(fromBottomNav: false),
    },
    {
      "color": Color(0xffd9f4ff),
      "image": "assets/image/parents.png",
      "lable": "Parents",
      "route": ParentScreen(),
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
      "route": CurriculumScreen(fromBottomNav: false),
    },
    {
      "color": Color(0xfff0f0f0),
      "image": "assets/image/timetable.png",
      "lable": "TimeTable",
      "route": FessPaymentScreen(),
    },
    {
      "color": Color(0xffd9f4ff),
      "image": "assets/image/fesshistry.png",
      "lable": "Fess History",
      "route": FissHistoryScreem(),
    },
    {
      "color": Color(0xffe0e3f3),
      "image": "assets/image/attendance.png",
      "lable": "Attendance",
      "route": AttendanceCalendar(),
    },
  ];
  void removeToken() async {
    var shrf = await SharedPreferences.getInstance();
    shrf.remove(authToken);
    debugPrint("Token is removed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(titleText: "Dashboard"),
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
                            child: Text(
                              "Scholar No. 112233",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.white,
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
                          child: CircleAvatar(
                            backgroundColor: Color(0xffbababa),
                            radius: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(20),
                                child: Image.asset(
                                  "assets/image/user.png",
                                  fit: BoxFit.cover,
                                  scale: 2,
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
            ],
          ),
        ],
      ),
    );
  }
}
