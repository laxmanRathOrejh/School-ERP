import 'package:flutter/material.dart';
import 'package:school_erp/model/teacher_chat_madel.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';

class ChatDataProvider extends ChangeNotifier {
  TeacherChatMadel? chatModel;

  final ScrollController scrollController = ScrollController();

  Future<void> getChatHistory({
    required BuildContext context,
    required Map<String, dynamic> teacherId,
  }) async {
    chatModel = null;
    notifyListeners();
    loadingBox(context: context);
    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.teacherChatHistory,
      requestData: teacherId,
    );
    if (response["status"] == 200) {
      debugPrint("here is respnse of CHAT$response");
      chatModel = TeacherChatMadel.fromJson(response);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(seconds: 1),
            curve: Curves.linear,
          );
        }
      });
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
