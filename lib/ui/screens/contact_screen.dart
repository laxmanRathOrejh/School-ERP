
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppbarWithBackWidget(titleText: "Contact Details"),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),

            Text(
              "St. Anselm's Pink City School",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff3B6FD8),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Color(0xffeeeeee),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Details",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff3B6FD8),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Address",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, top: 10),
                          child: Text(
                            "St. Anselm's Senior Senondary School Sector -6 heri path manshrover -jaipuir 302017",
                            style: TextStyle(color: Color(0xFFBCBBBB)),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.call, color: Color(0xff3B6FD8)),
                            SizedBox(width: 10),
                            Text(
                              "Have Any Questions?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, top: 10),
                          child: Text(
                            "014-2786700-2785705",
                            style: TextStyle(color: Color(0xFFBCBBBB)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            Icon(Icons.send, color: Color(0xff3B6FD8)),
                            SizedBox(width: 10),
                            Text(
                              "Mail Us",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, top: 10),
                          child: Text(
                            "Laxman1narawat@gmail.com",
                            style: TextStyle(color: Color(0xFFBCBBBB)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Color(0xffeeeeee),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Principal Office Hour",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.alarm, color: Color(0xff3B6FD8)),
                            SizedBox(width: 10),
                            Text(
                              "On School days only",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, top: 10),
                          child: Text(
                            "8:30 AM to 10:30 AM (other times by oppoinment)",
                            style: TextStyle(color: Color(0xFFBCBBBB)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Color(0xffeeeeee),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "School Hours",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.alarm, color: Color(0xff3B6FD8)),
                            SizedBox(width: 10),
                            Text(
                              "Summer :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3B6FD8),
                              ),
                            ),
                            Text(" 7:20 AM to 1:00 PM"),
                          ],
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Icon(Icons.alarm, color: Color(0xff3B6FD8)),
                            SizedBox(width: 10),
                            Text(
                              "Winter :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3B6FD8),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                " 7:50 AM to 130 PM",
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Color(0xffeeeeee),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Metting Hour for Parents",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.alarm, color: Color(0xff3B6FD8)),
                            SizedBox(width: 10),
                            Text(
                              "Saturday Summer :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3B6FD8),
                              ),
                            ),
                            Text(" !1 AM to 1:00 PM"),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 33),
                            Expanded(
                              child: Text.rich(
                                textAlign: TextAlign.left,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Winter : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff3B6FD8),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "11:30 AM to 12:30 PM Noon and during P.T.M",

                                      style: TextStyle(
                                        textBaseline: TextBaseline.alphabetic,

                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff3B6FD8),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(18),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.call),
                    Icon(Icons.email),
                    Icon(Icons.message),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
