import 'package:flutter/material.dart';
import 'package:school_erp/model/session_model.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class FessProvider extends ChangeNotifier {
  SessionModel? sessiondata;
  List allSession = [];

  Future<void> getSession({required BuildContext context}) async {
    loadingBox(context: context);
    var response = await ApiCall.getRequest(endPoint: ApiEndpoint.session);
    if (response["status"] == 200) {
      sessiondata = SessionModel.fromJson(response);
      allSession = sessiondata!.sessian!.map((e) => e.year!).toList();
      notifyListeners();
      //  debugPrint("Data from Model${sessiondata?.sessian?[2].year}");
      debugPrint("here is model data${sessiondata?.message}");
      notifyListeners();
    } else if (response["status"] == 400) {
      debugPrint("cant full fill request ${response["message"]}");
    } else {
      debugPrint("Not call Api $response");
    }
    if (!context.mounted) return;
    hideLoader(context);
    // List<String> years = sessiondata.sessions!
    // .map((session) => session.year!)
    // .toList();
  }
}
