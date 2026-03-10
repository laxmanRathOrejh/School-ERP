import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:school_erp/service/api_endpoint.dart';

class ApiCall {
  static Future<void> getRequest({required String endPoint}) async {
    try {
      String APIUrl = "${ApiEndpoint.serverURL}$endPoint";
      debugPrint("API server url data = $APIUrl");
      var response = await http.get(Uri.parse(endPoint));

      if (response.statusCode == 200) {
        var userData = jsonDecode(response.body);

        debugPrint(userData);
      }
    } catch (e) {
      debugPrint(e.toString());
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
        return response.body;
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
