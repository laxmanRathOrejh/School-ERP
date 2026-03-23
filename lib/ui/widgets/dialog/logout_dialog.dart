import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_erp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logOutBox({required BuildContext context}) {
  showDialog(
    context: context,

    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Row(
          children: const [
            Icon(Icons.info_outline, color: Colors.blue),
            SizedBox(width: 8),
          ],
        ),
        content: Text(
          "Are you sure you want log out",
          textAlign: TextAlign.center,

          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    var shrf = await SharedPreferences.getInstance();
                    shrf.remove(authToken);
                    debugPrint("Token is removed");
                    if (!context.mounted) return;
                    context.go("/login/Screen");
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Logout",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
