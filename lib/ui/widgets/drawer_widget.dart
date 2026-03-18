import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70),
        Container(
          decoration: BoxDecoration(),
          margin: EdgeInsets.zero,
          child: CircleAvatar(radius: 70, backgroundColor: Color(0xfff00000)),
        ),
        SizedBox(height: 10),
        Text(
          "Webnautical",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Class - "), Text("Dropout")],
        ),
        SizedBox(height: 5),

        Container(
          color: Color(0xFF337ce2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 4, height: 25),
              Text(
                "Scholor No ",
                style: TextStyle(fontSize: 15, color: Color(0xffffffff)),
              ),
              Text(
                "112233",
                style: TextStyle(fontSize: 15, color: Color(0xffffffff)),
              ),
              SizedBox(width: 4),
            ],
          ),
        ),
        SizedBox(height: 30),
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        child: Icon(
                          Icons.layers_outlined,
                          size: 30,
                          color: Color(0xFF337ce2),
                        ),
                      ),
                      SizedBox(width: 10),

                      Expanded(
                        child: Text("Library", style: TextStyle(fontSize: 16)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 30,
                          color: Color(0xFF337ce2),
                        ),
                      ),
                      SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          "Add Account",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        child: Icon(
                          Icons.facebook_outlined,
                          size: 30,
                          color: Color(0xFF337ce2),
                        ),
                      ),
                      SizedBox(width: 10),

                      Expanded(
                        child: Text("About Us", style: TextStyle(fontSize: 16)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        child: Icon(
                          Icons.call,
                          size: 30,
                          color: Color(0xFF337ce2),
                        ),
                      ),
                      SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          "Contact Us",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
