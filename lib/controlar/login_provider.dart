import 'package:flutter/material.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';

class LoginProvider extends ChangeNotifier {
  void login({required Map<String, dynamic> requestData}) {
    ApiCall.getRequest(endPoint: ApiEndpoint.login);
    ApiCall.postRequest(endPoint: "", requestData: requestData);
  }
}
