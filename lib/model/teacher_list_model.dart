class TeacherList {
  int? status;
  String? message;
  List<TeacherData>? teacherData;

  TeacherList({this.status, this.message, this.teacherData});
  TeacherList.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    message = data["message"];
    teacherData = (data["data"]as List).map((e) => TeacherData.fromJson(e)).toList();
  }
}

class TeacherData {
  int? teacherId;
  String? teacherName;
  String? designation;
  String? profilPic;
  TeacherData({
    this.teacherId,
    this.teacherName,
    this.designation,
    this.profilPic,
  });
  TeacherData.fromJson(Map<String, dynamic> json) {
    teacherId = json["teacher_id"];
    teacherName = json["teacher_name"];
    designation = json["designation"];
    profilPic = json["teacher_photo"];
  }
}
