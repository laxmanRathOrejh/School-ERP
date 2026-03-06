import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  static Future<void> getRequest({required String endPoint}) async {
    try {
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
  bool isLoding = false;
  static Future<void> postRequest({
    required String endPoint,
    required Map<String, dynamic> requestData,
  }) async {
    
    try {
      var response = await http.post(
        Uri.parse(endPoint),
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 201) {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
