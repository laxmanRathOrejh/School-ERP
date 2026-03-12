
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:school_erp/ui/widgets/student_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class StudentProfilScreen extends StatelessWidget {
  final bool fromBottomNav;
  const StudentProfilScreen({super.key, required this.fromBottomNav});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fromBottomNav
          ? AppbarWidget(titleText: "Profile")
          : AppbarWithBackWidget(titleText: "Profile"),
      body: Container(
        color: Color(0xffeeeeee),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Student List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    "assets/image/student.jpg",
                                  ),
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text(
                                  "Harsh kodecha",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: StudentInfmoWidget(
                                firstText: "Scholor No",
                                lastText: "112333445",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: StudentInfmoWidget(
                                firstText: "Class",
                                lastText: "X",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 8,
                              ),
                              child: StudentInfmoWidget(
                                firstText: "Father's Name",
                                lastText: "Harsh Sharma",
                              ),
                            ),
                            Divider(
                              indent: 8,
                              endIndent: 8,
                              thickness: 4,

                              color: Color(0xff4d97c7),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                bottom: 8,
                              ),
                              child: StudentInfmoWidget(
                                firstText: "Mother's Name",
                                lastText: "Neha Sharma",
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: StudentInfmoWidget(
                                firstText: "Contact No",
                                lastText: "701425038",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 2.0,
                                dashColor: Color(0xffececec),
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: StudentInfmoWidget(
                                firstText: "Email",
                                lastText: "HarshSharma1@gmail.com",
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Address Info",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "95442 Civil Line Jaipur",
                                style: TextStyle(color: Color(0xffcecece)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
