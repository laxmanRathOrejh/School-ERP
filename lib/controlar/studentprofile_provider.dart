import 'package:flutter/material.dart';
import 'package:school_erp/model/student_profile_model.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class StudentprofileProvider extends ChangeNotifier {
  StudentModel? studentModel;
  void getStudentProfile({required BuildContext context}) async {
    loadingBox(context: context);
    var response = await ApiCall.getRequest(
      endPoint: ApiEndpoint.studentDetails,
    );

    if (response !=null && response["status"] == 200) {
      studentModel = StudentModel.fromJson(response);
      notifyListeners();
      debugPrint(
        "Here is response from student Model ${studentModel?.studentProfile?.address}",
      );
      //add data to model
      debugPrint("here id data from api $response");
    } else if (response !=null && response["status"] == 400) {
      debugPrint("code 400 cant ${response["message"]}");
    } else {
      debugPrint("here is response if mrhad not work $response");
    }
    if (!context.mounted) return;
    hideLoader(context);
  }
}
