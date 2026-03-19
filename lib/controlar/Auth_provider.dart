import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';
import 'package:school_erp/ui/widgets/dialog/message_dialog.dart';
import 'package:school_erp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String mobileNo = "";
  String tokanFromServer = "";

  Future<void> login({
    required Map<String, dynamic> requestData,
    required BuildContext context,
  }) async {
    loadingBox(context: context);

    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.login,
      requestData: requestData,
    );
   // Map<String, dynamic> data = jsonDecode(response);
   // debugPrint(
     // "This is response from Api Which we see in Provider${data["status"]}",
   // );
    if (!context.mounted) return;
    hideLoader(context);
    if (response["status"] == 200) {
      mobileNo = response["mobile_no"];
      if (response["is_pin"] == true) {
        context.push("/Verificatin/Screen");
      } else if (response["is_pin"] == false) {
        context.push("/CreatePin/Screen");
      } else {
        showMessageBox(context: context, text: response["error"]);
      }
    } else if (response["status"] == 400) {
      showMessageBox(context: context, text: response["error"]);
    } else {
      showMessageBox(context: context, text: response.toString());
    }

    debugPrint(requestData.toString());
  }

  // Cheak PIN
  Future<void> pinVerfication({
    required BuildContext context,
    required Map<String, dynamic> requestData,
  }) async {
    loadingBox(context: context);

    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.verifiy,
      requestData: requestData,
    );
  //  Map<String, dynamic> data = jsonDecode(response);
    if (!context.mounted) return;

    hideLoader(context);
    if (response["status"] == 200) {
      tokanFromServer = response["token"];
      saveToken(tokanFromServer);
      context.go("/home/Screen");
      debugPrint("here we see token in provider $tokanFromServer");
    } else if (response["status"] == 400) {
      showMessageBox(context: context, text: response["error"]);
    } else {
      showMessageBox(context: context, text: response.toString());
    }
  }

  //SAVE TOKEN IN LOCAL MEMORMRY
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint("token from share prefrnce function $tokanFromServer");
    await prefs.setString(authToken, tokanFromServer);
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
        context.go("/home/Screen");
      } else {
        context.go("/login/Screen");
      }
    });
  }
}
