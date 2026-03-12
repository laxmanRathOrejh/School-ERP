
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';

class CurriculumScreen extends StatelessWidget {
  final bool fromBottomNav;

  const CurriculumScreen({super.key, required this.fromBottomNav});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fromBottomNav
          ? AppbarWidget(titleText: "Curriculum")
          : AppbarWithBackWidget(titleText: "Curriculum"),

      body: Container(
        color: Color(0xfff0f0f0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Curriculum",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            shape: BeveledRectangleBorder(),
                            backgroundColor: Color(0xff528fe6),
                            foregroundColor: Color(0xffffffff),
                          ),

                          onPressed: () {},
                          child: Text(
                            "General",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(left: 10, right: 10),

                            shape: BeveledRectangleBorder(),
                            backgroundColor: Color(0xffffffff),
                            foregroundColor: Color(0xFF454444),
                          ),

                          onPressed: () {},
                          child: Text(
                            "Class wise",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(
                          width: 0.1,
                          color: Color(0xffffffff),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => NoticBordScreen(),
                                //   ),
                                // );
                              },
                              child: ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    color: Color(0xffdeeef8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(
                                        Icons.wallet_rounded,
                                        size: 29,
                                        color: Color(0xff5e99e7),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Upcoming Events & important Dates.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Stay informend with our latest school events holdidays and essentmate dates Chek here regularly",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff909090),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Row(
                            children: [
                              SizedBox(width: 30),
                              Icon(Icons.link, color: Color(0xff9c9c9c)),
                              Expanded(
                                child: Text(
                                  " 2 Attachments",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff909090),
                                  ),
                                ),
                              ),
                              Text(
                                "3:35PM | 29 May 2024",
                                style: TextStyle(
                                  fontSize: 12,

                                  color: Color(0xff909090),
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
