import 'package:flutter/material.dart';

class AppbarWithBackWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String titleText;
  const AppbarWithBackWidget({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        titleText,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
