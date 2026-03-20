import 'package:flutter/material.dart';
import 'package:school_erp/model/fess_hist_model.dart';
import 'package:school_erp/model/session_model.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/ui/widgets/dialog/loding_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

// class FessProvider extends ChangeNotifier {
//   SessionModel? sessiondata;
//   List allSession = [];

//   Future<void> getSession({required BuildContext context}) async {
//     loadingBox(context: context);
//     var response = await ApiCall.getRequest(endPoint: ApiEndpoint.session);
//     if (response["status"] == 200) {
//       sessiondata = SessionModel.fromJson(response);
//       allSession = sessiondata!.sessian!.map((e) => e.year!).toList();
//       notifyListeners();
//       //  debugPrint("Data from Model${sessiondata?.sessian?[2].year}");
//       debugPrint("here is model data${sessiondata?.message}");
//       notifyListeners();
//     } else if (response["status"] == 400) {
//       debugPrint("cant full fill request ${response["message"]}");
//     } else {
//       debugPrint("Not call Api $response");
//     }
//     if (!context.mounted) return;
//     hideLoader(context);
//     // List<String> years = sessiondata.sessions!
//     // .map((session) => session.year!)
//     // .toList();
//   }
// }
class FessProvider extends ChangeNotifier {
  SessionModel? sessionData;
  List<String>? allSession;

  Future<void> getSession({required BuildContext context}) async {
    if (!context.mounted) return;

    loadingBox(context: context);

    try {
      var response = await ApiCall.getRequest(endPoint: ApiEndpoint.session);

      if (response !=null && response["status"] == 200) {
        sessionData = SessionModel.fromJson(response);

        // safely extract session years
        allSession = sessionData?.sessian?.map((e) => e.year??"").toList()??[];
        // sessionData?.sessian
        //     ?.map((e) => e.year ?? "")
        //     .where((year) => year.isNotEmpty)
        //     .toList() ??
        // [];

        debugPrint("Data from Model: ${sessionData?.message}");
        notifyListeners();
      } else {
        debugPrint("API error: ${response["message"]}");
      }
    } catch (e) {
      debugPrint("Exception in getSession: $e");
    } finally {
      if (context.mounted) hideLoader(context);
    }
  }

  FessHistModel? fessHistModel;
  Future<void> getFessHistory({
    required BuildContext context,
    required int sesianId,
  }) async {
    loadingBox(context: context);

    var response = await ApiCall.postRequest(
      endPoint: ApiEndpoint.fessHistory,
      requestData: {"school_session": sesianId},
    );

    if (response["status"] == 200) {
      fessHistModel = FessHistModel.fromJson(response);
      notifyListeners();
      //add data to model
    } else if (response["status"] == 400) {
      debugPrint("respons from code 400 ${response["message"]}");
    } else {
      debugPrint("here is api respnse $response");
    }
    if (!context.mounted) return;
    hideLoader(context);
  }

  Future<void> downlideResp() async {
    String url =
        "${ApiEndpoint.serverURL}${fessHistModel?.fessData?[0].reciptNo}";
    // String url = "https://nauticalerp.itworkshop.in/";
    //url += "${fessHistModel?.fessData?[0].reciptNo}";
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
    //${ApiEndpoint.serverURL}$endPoint"
  }
}
