import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:school_erp/service/api_endpoint.dart';
import 'package:school_erp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCall {
  ///Get Function//
  static Future<dynamic> getRequest({required String endPoint}) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString(authToken);

      Map<String, String> appHeader = {"Content-Type": "application/json"};

      if (token != null) {
        appHeader["Authorization"] = "Bearer $token";
      }

      String APIUrl = "${ApiEndpoint.serverURL}$endPoint";
      debugPrint("API server url data = $APIUrl");
      var response = await http.get(Uri.parse(APIUrl), headers: appHeader);

      debugPrint("here is acuular RESPONSE ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      debugPrint("here is erro from get Methad $e");
      rethrow;
    }
  }

  //////PostMethod//
  ///
  static Future<dynamic> postRequest({
    required String endPoint,
    required Map<String, dynamic> requestData,
  }) async {
    try {
      String apiUrl = "${ApiEndpoint.serverURL}$endPoint";
      debugPrint("POST API server url data = $apiUrl");
      debugPrint("request data = ${json.encode(requestData)}");

      var response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestData),
        headers: {"Content-Type": "application/json"},
      );
      debugPrint("APi Response = ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      debugPrint("here is error $e");
    }
  }
}
