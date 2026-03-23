class FessPaymentModel {
  bool? prviousFessStatus;
  int? priviousSessionId;
  String? message;
  int? status;

  List<FessData>? fessData;
  FessPaymentModel({
    this.priviousSessionId,
    this.prviousFessStatus,
    this.fessData,
    this.message,
    this.status,
  });

  FessPaymentModel.fromjson(Map<String, dynamic> json) {
    prviousFessStatus = json["previousFeesStatus"];
    priviousSessionId = json["previousSessionId"];
    message = json["message"];
    status = json["status"];
    fessData = (json["data"] as List).map((e) => FessData.fromJson(e)).toList();
  }
}

class FessData {
  String? quarter;
  int? schoolFessId;
  int? fessGroupId;
  String? registerNo;
  int? total;
  int? remainigAmount;
  int? schoolSession;
  int? lateFess;
  String? status;
  String? dueDate;
  String? qtrGroupId;
  bool? isOptional;
  bool? isSelected;
  bool? isDisabled;

  FessData.fromJson(Map<String, dynamic> jsonData) {
    quarter = jsonData["quarter"];
    schoolFessId = jsonData["school_fees_id"];
    fessGroupId = jsonData["fees_group_id"];
    registerNo = jsonData["regNo"];
    total = jsonData["total"];
    remainigAmount =jsonData["remaining_amount"];
    schoolSession = jsonData["school_session"];
    lateFess =      jsonData["late_fees"];
    status =        jsonData["status"];
    dueDate =       jsonData["due_date"];
    qtrGroupId =    jsonData["qtr_group_id"];
    isOptional =    jsonData["is_optional"];
    isSelected =    jsonData["is_selected"];
    isDisabled =    jsonData["is_disabled"];
  }
}
