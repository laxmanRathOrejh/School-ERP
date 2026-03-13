import 'package:flutter/material.dart';
import 'package:school_erp/model/teacher_chat_madel.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class ChatDataProvider extends ChangeNotifier {
  TeacherChatMadel? chatMadel;
  Future<void> getChatHistory({
    required BuildContext context,
    required Map<String, dynamic> teacherId,
  }) async {
    loadingBox(context: context);
    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.teacherChatHistory,
      requestData: teacherId,
    );
    if (response["status"] == 200) {
      debugPrint("here is respnse of CHAT$response");
      chatMadel = TeacherChatMadel.fromJson(response);
      notifyListeners();
    } else if (response["status"] == 400) {
      debugPrint("data not found $response");
    } else {
      debugPrint("errr $response");
    }
    if (!context.mounted) return;

    hideLoader(context);
  }
}
