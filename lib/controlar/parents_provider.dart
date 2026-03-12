import 'package:flutter/widgets.dart';
import 'package:school_erp/model/parent_model.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class ParentsProvider extends ChangeNotifier {
  Student? parentsDetails;

  Future<void> parentDetails({required BuildContext context}) async {
    showAlertBox(context: context);

    var response = await ApiCall.getRequest(
      endPoint: ApiEndpoint.parentsDetails,
    );
    debugPrint("Respoponse from get api Parents details $response");
    if (response["status"] == 200) {
      parentsDetails = APIResponse.formjson(response).student;
      notifyListeners();
    } else if (response["status"] == 400) {
    } else {}
    if (!context.mounted) return;

    hideLoader(context);
    // print("here is model ${apiResponse.student?.fatherQuali}");
  }
}
