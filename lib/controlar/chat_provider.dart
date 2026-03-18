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
    required int teacherId,
    bool isloding = true,
  }) async {
    if (isloding) {
      chatModel = null;
    }
    notifyListeners();
    if (isloding) {
      loadingBox(context: context);
    }
    try {
      var response = await ApiCall.postRequest(
        endPoint: ApiEndpoint.teacherChatHistory,
        requestData: {"teacher_id": teacherId},
      );
      if (response["status"] == 200) {
        debugPrint("here is respnse of CHAT$response");
        chatModel = TeacherChatMadel.fromJson(response);

        notifyListeners();
        if (isloding) {
          scrollToBottom();
        }
      } else if (response["status"] == 400) {
        debugPrint("data not found $response");
      } else {
        debugPrint("errr $response");
      }
      if (!context.mounted) return;

      if (isloding) {
        hideLoader(context);
      }
    } catch (e) {
      debugPrint("Cant full file demand $e");
    }
  }

  void sendMessage({
    required Map<String, dynamic> message,
    required BuildContext context,
  }) async {
    try{
    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.sendMessage,
      requestData: message,
    );
    if (response["status"] == 200) {
      if (!context.mounted) return;

      getChatHistory(
        context: context,
        teacherId: message["teacher_id"],
        isloding: false,
      );
      //   ApiCall.postRequest(endPoint: ApiEndpoint.teacherChatHistory,requestData: message);
      //   scrollToBottom();
      notifyListeners();
    } else if (response["status"] == 400) {
      debugPrint("message not send sucessfully ${response["message"]}");
    } else {
      debugPrint("Here is meeage Api Responnse$response");
    }}catch (e) {
      debugPrint("Cant full file demand $e");
    }
  }

  //
  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   if (scrollController.hasClients) {
  //     scrollToBottom();
  //     scrollController.animateTo(
  //       scrollController.position.maxScrollExtent,
  //       duration: Duration(seconds: 1),
  //       curve: Curves.linear,
  //     );
  //   }
  // });
  //  }

  void scrollToBottom() {
    if (!scrollController.hasClients) return;

    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }
}
