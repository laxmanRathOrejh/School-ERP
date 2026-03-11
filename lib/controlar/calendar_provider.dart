import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class CalendarProvider extends ChangeNotifier {
  Map<String, dynamic> allEvent = {};
  void getCalendardata({required BuildContext context}) async {
    showAlertBox(context: context);
    var data = await ApiCall.getRequest(endPoint: ApiEndpoint.calender);
    Map<String, dynamic> calenderData = jsonDecode(data);

    debugPrint("here is calender data $calenderData");

    if (calenderData["status"] == 200) {
      debugPrint("type of data${calenderData.runtimeType}");
      allEvent = calenderData;
      notifyListeners();
      debugPrint(allEvent.toString());
    } else if (calenderData["status"] == 400) {
      debugPrint(calenderData["message"]);
    } else {
      debugPrint(calenderData.toString());
    }

    if (!context.mounted) return;

    hideLoader(context);
  }

  ///event store
  List<dynamic> getEventsForDay(DateTime day) {
    final data = allEvent["data"];
    if (data == null) return [];

    String dateKey =
        "${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}";

    return data[dateKey] ?? [];
  }
}
