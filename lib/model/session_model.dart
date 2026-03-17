class SessionModel {
  String? message;
  int? stutas;
  List<SessionData>? sessian;

  SessionModel({this.message, this.sessian, this.stutas});

  SessionModel.fromJson(Map<String, dynamic> jsSonData) {
    message = jsSonData["message"];
    stutas = jsSonData["status"];
    sessian = (jsSonData["sessions"] as List)
        .map((e) => SessionData.fromJson(e))
        .toList();
  }
}

class SessionData {
  int? schoolId;
  String? year;
  String? status;
  int? exisitStatus;
  String? createAt;
  String? updateAt;

  SessionData({
    this.schoolId,
    this.year,
    this.status,
    this.exisitStatus,
    this.createAt,
    this.updateAt,
  });
  SessionData.fromJson(Map<String, dynamic> sesianData) {
    schoolId = sesianData["id"];
    year = sesianData["year"];
    status = sesianData["status"];
    exisitStatus = sesianData["exist_status"];
    createAt = sesianData["created_at"];
    updateAt = sesianData["updated_at"];
  }

  // "id": 1,
  //           "school_id": 1,
  //           "year": "2025-2026",
  //           "status": "0",
  //           "exist_status": 1,
  //           "created_at": "2026-01-27T06:28:48.000000Z",
  //           "updated_at": "2026-01-27T06:29:05.000000Z"
  //   }
}
