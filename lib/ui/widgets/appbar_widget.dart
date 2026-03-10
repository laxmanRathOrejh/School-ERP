
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  const AppbarWidget({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xffffffff),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Color(0xFF337ce2),
          child: Icon(Icons.menu),
        ),
      ),
      centerTitle: true,
      title: Text(
        titleText,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      ),
      actions: [
        SizedBox(
          height: 45,
          child: Image.asset("assets/image/cbse2.png", fit: BoxFit.fill),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
