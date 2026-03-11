import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class CalendarProvider extends ChangeNotifier {
  void getCalendardata({required BuildContext context}) async {
    showAlertBox(context: context);
    var data = await ApiCall.getRequest(endPoint: ApiEndpoint.calender);
    Map<String, dynamic> calenderData = jsonDecode(data);

    debugPrint("here is calender data $calenderData");

    if (!context.mounted) return;

    hideLoader(context);

    if (calenderData["status"] == 200) {
      debugPrint(calenderData["message"]);
    } else if (calenderData["status"] == 400) {
      debugPrint(calenderData["message"]);
    } else {
      debugPrint(calenderData.toString());
    }
  }
}
