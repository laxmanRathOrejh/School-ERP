import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/screens/create_pin_screen.dart';
import 'package:school_erp/ui/screens/dashboard_screen.dart';
import 'package:school_erp/ui/screens/login_screen.dart';
import 'package:school_erp/ui/screens/verification_screen.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';
import 'package:school_erp/ui/widgets/dialog/message_dialog.dart';
import 'package:school_erp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String mobileNo = "";
  String tokan =    "";
  

  Future<void> login({
    required Map<String, dynamic> requestData,
    required BuildContext context,
  }) async {
    showAlertBox(context: context);

    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.login,
      requestData: requestData,
    );
    Map<String, dynamic> data = jsonDecode(response);
    debugPrint(
      "This is response from Api Which we see in Provider${data["status"]}",
    );
    if (!context.mounted) return;

    hideLoader(context);

    if (data["status"] == 200) {
      mobileNo = data["mobile_no"];
      if (data["is_pin"] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerificationScreen()),
        );
      } else if (data["is_pin"] == false) {
        ///////////
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreatePinScreen()),
        );

        ///Navigator to Create pin screen
      } else {
        showMessageBox(context: context, text: data["error"]);
      }
    } else if (data["status"] == 400) {
      showMessageBox(context: context, text: data["error"]);
    } else {
      showMessageBox(context: context, text: data.toString());
    }

    debugPrint(requestData.toString());
  }

  // Cheak PIN
  Future<void> pinVerfication({
    required BuildContext context,
    required Map<String, dynamic> requestData,
  }) async {
    showAlertBox(context: context);

    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.verifiy,
      requestData: requestData,
    );
    Map<String, dynamic> data = jsonDecode(response);
    if (!context.mounted) return;

    hideLoader(context);
    if (data["status"] == 200) {
      tokan = data["token"];
      saveToken(tokan);
      debugPrint("here we see token in provider $tokan");
    } else if (data["status"] == 40) {
      showMessageBox(context: context, text: data["error"]);
    } else {
      showMessageBox(context: context, text: data.toString());
    }
  }

  //SAVE TOKEN IN LOCAL MEMORMRY
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint("token from share prefrnce function $tokan");
    await prefs.setString(authToken, tokan);
    var url = prefs.getString("Token");
    debugPrint("token from phne Memory $url");
  }

  //ChekToken for Screen 
  void chekToken({required BuildContext context}) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString(authToken);
    debugPrint("this is token from memory$token");
    Timer(const Duration(seconds: 2), () {
      if (token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScrenn()),
        );
      }
    });
  }
}
