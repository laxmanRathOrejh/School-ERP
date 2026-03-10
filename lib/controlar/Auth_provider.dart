import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/screens/verification_screen.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';
import 'package:school_erp/ui/widgets/dialog/message_dialog.dart';

class AuthProvider extends ChangeNotifier {
  String mobileNo = "";
  String tokan = "";

  Future<void> login({
    required Map<String, dynamic> requestData,
    required BuildContext context,
  }) async {
    showAlertBox(context);

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
      //notifyListeners();
      if (data["is_pin"] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerificationScreen()),
        );
      } else if (data["is_pin"] == false) {
        ///////////
        ///Navigator to Create pin screen
        ///
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

  Future<void> pinVerfication({
    required BuildContext context,
    required Map<String, dynamic> requestData,
  }) async {
    showAlertBox(context);

    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.verifiy,
      requestData: requestData,
    );
    Map<String, dynamic> data = jsonDecode(response);
    if (!context.mounted) return;

    hideLoader(context);
    if (data["status"] == 200) {
      tokan = data["token"];
      debugPrint("here we see token in provider $tokan");
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => DashboardScreen()),
      // );
      ///
      ///
      ///Navigate to dashbord
    } else if (data["status"] == 400) {
      showMessageBox(context: context, text: data["error"]);
    } else {
      showMessageBox(context: context, text: data.toString());
    }
  }
  
}
