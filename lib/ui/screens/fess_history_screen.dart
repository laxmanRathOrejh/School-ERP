
import 'package:flutter/material.dart';

class FissHistoryScreem extends StatelessWidget {
  const FissHistoryScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fess History",
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
              "Fee History List",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
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

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            ],
                          ),
                          Divider(endIndent: 10, indent: 10),
                          Row(
                            children: [
                              SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  "View The fess Breakup >>",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF337ce2),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF337ce2),

                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      5,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SizedBox(width: 5),

                                    Icon(Icons.file_download_outlined),
                                    SizedBox(width: 5),
                                    Text(
                                      "Download Recipient  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
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
