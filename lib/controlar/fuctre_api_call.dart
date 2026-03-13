import 'package:school_erp/model/parent_model.dart';
import 'package:school_erp/service/api_call.dart';
import 'package:school_erp/service/api_endpoint.dart';

Future<APIResponse> getParentsDetail() async {
  var parentData = await ApiCall.getRequest(
    endPoint: ApiEndpoint.parentsDetails,
  );

  return APIResponse.formjson(parentData);
}
