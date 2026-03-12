
import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';

class PtChatsScreen extends StatelessWidget {
    final bool fromBottomNav;

 const PtChatsScreen({super.key,required this.fromBottomNav});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fromBottomNav
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
                      "Student List",
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
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ChatScreen(),
                          //   ),
                          // );
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
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Color(0xffbababa),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(20),
                                      child: Icon(
                                        Icons.person,
                                        size: 58,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        ": Rakesh",
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
                                        "Scholor No ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ": 1234567",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
