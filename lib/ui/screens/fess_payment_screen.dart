
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/next_button.dart';

class FessPaymentScreen extends StatelessWidget {
  const FessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fess payment",
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
        actions: [
          Icon(Icons.history_sharp, size: 30, color: Color(0xffa3a3a3)),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quarter list",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffffffff),
                          border: Border.all(color: Color(0xffffffff)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: SizedBox(
                                    child: Image.asset(
                                      "assets/image/payment.png",
                                      scale: 10,
                                      color: Color(0xFF337ce2),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "1 ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Quater",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Total Fess -",
                                            style: TextStyle(
                                              color: Color(0xffa3a3a3),
                                            ),
                                          ),
                                          Text(
                                            " 20000",
                                            style: TextStyle(
                                              color: Color(0xffa3a3a3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffa3a3a3),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                            Divider(endIndent: 10, indent: 10),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFF337ce2),
                                ),

                                Text(
                                  "Due Date - ",
                                  style: TextStyle(color: Color(0xFF337ce2)),
                                ),
                                Expanded(
                                  child: Text(
                                    "20 Apr 2025",
                                    style: TextStyle(),
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  height: 25,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFf5cecd),

                                      foregroundColor: const Color(0xFFd26f71),
                                      padding: EdgeInsets.all(0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(0),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text("Pending"),
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                            SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            NextButton(onTap: () {}, text: "Pay"),
          ],
        ),
      ),
    );
  }
}
