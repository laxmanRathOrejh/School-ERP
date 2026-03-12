class APIResponse {
  Student? student;
  int? stutas;
  APIResponse({this.student, this.stutas});

  APIResponse.formjson(Map<String, dynamic> data) {
    stutas = data["status"];
    student = Student.fromjson(data["Data"]);
  }
}

class Student {
  String? studentName;
  String? scholarNo;
  String? profilPic;
  String? fatherName;
  String? fatherProf;
  String? fatherQuali;
  String? fatherNo;
  String? motherName;
  String? motherProf;
  String? motherQuali;
  String? motherNo;

  Student({
    this.studentName,
    this.scholarNo,
    this.profilPic,
    this.fatherName,
    this.fatherProf,
    this.fatherQuali,
    this.fatherNo,
    this.motherName,
    this.motherNo,
    this.motherProf,
    this.motherQuali,
  });

  Student.fromjson(Map<String,dynamic> json){
     studentName =json["student_name"];
    scholarNo=json["scholar_no"];
    profilPic=json["profile_pic"];
    fatherName=json["father_name"];
    fatherProf=json["fathers_profession"];
    fatherQuali=json["fathers_qualification"];
    fatherNo=json["fathers_mobile"];
    motherName=json["mother_name"];
    motherNo=json["mothers_mobile"];
    motherProf=json["mothers_profession"];
    motherQuali=json["mothers_qualification"];
  }
}
