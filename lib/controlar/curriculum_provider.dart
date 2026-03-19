import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:school_erp/model/curriculum_model.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class CurriculumProvider extends ChangeNotifier {
  NoticeModel? noticeModel;
  void getCurriculum({required BuildContext context}) async {
    loadingBox(context: context);
    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.curriculum,
      requestData: {},
    );

    if (response["status"] == 200) {
      //add data to model
      noticeModel = NoticeModel.fromJson(response);
      notifyListeners();
      debugPrint(
        "resopone from Circulaam Model ${noticeModel?.genaralNotice?[0].id.toString()}",
      );
      debugPrint("Sucessfully get response $response");
    } else if (response["status"] == 400) {
      debugPrint("Status 400 in Notice Api$response");
    } else {
      debugPrint("cant get data from Notice BoadA Api$response");
    }
    if (!context.mounted) return;

    hideLoader(context);
  }

  String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return "";

    DateTime date = DateTime.parse(dateString).toLocal();
    return DateFormat('h:mm a || d MMM yyyy').format(date);
  }
}
