class TeacherChatMadel {
  int? status;
  String? message;
  List<ChatsDetail>? chatData;

  TeacherChatMadel({this.status, this.chatData, this.message});
  TeacherChatMadel.fromJson(Map<String, dynamic> apiRespnse) {
    status = apiRespnse["status"];
    message = apiRespnse["message"];
    chatData = (apiRespnse["chats"] as List)
        .map((e) => ChatsDetail.fromJson(e))
        .toList();
  }
}

class ChatsDetail {
  int? id;
  String? studentName;
  String? scholarNo;
  String? teacherName;
  String? designation;
  String? message;
  int? chatStatus;
  String? date;
  String? time;

  ChatsDetail({
    this.id,
    this.studentName,
    this.scholarNo,
    this.teacherName,
    this.designation,
    this.message,
    this.chatStatus,
    this.date,
    this.time,
  });

  ChatsDetail.fromJson(Map<String, dynamic> chatData) {
    id = chatData["id"];
    studentName = chatData["student_name"];
    scholarNo = chatData["scholar_no"];
    teacherName = chatData["teacher_name"];
    designation = chatData["designation"];
    message = chatData["message"];
    chatStatus = chatData["status"];
    date = chatData["date"];
    time = chatData["time"];
  }
}
