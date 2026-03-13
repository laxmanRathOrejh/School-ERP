import 'package:flutter/material.dart';
import 'package:school_erp/model/teacher_list_model.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class TeacherListProvider extends ChangeNotifier {
  TeacherList? teacherList;
  Future<void> getTeacherList({required BuildContext context}) async {
    loadingBox(context: context);
    var respnse = await ApiCall.getRequest(endPoint: ApiEndpoint.teacherList);
    if (respnse["status"] == 200) {
      teacherList= TeacherList.fromJson(respnse);
      // teacherList = fromjson;
      notifyListeners();
      //add data to model
    } else if (respnse["status"] == 400) {
      debugPrint(respnse["message"]);
    } else {
      debugPrint(respnse);
    }
    if (!context.mounted) return;
    hideLoader(context);
    debugPrint("Teacher list respnse $respnse");
  }
}
