import 'package:flutter/material.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class CalendarProvider extends ChangeNotifier {
  Map<String, dynamic> allEvent = {};
  void getCalendardata({required BuildContext context}) async {
    showAlertBox(context: context);
    var eventdata = await ApiCall.getRequest(endPoint: ApiEndpoint.calender);
   // Map<String, dynamic> calenderData = jsonDecode(data);

   // debugPrint("here is calender data $calenderData");

    if (eventdata["status"] == 200) {
   //   debugPrint("type of data${calenderData.runtimeType}");
      allEvent = eventdata;
      notifyListeners();
      debugPrint(allEvent.toString());
    } else if (eventdata["status"] == 400) {
      debugPrint(eventdata["message"]);
    } else {
      debugPrint(eventdata.toString());
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
