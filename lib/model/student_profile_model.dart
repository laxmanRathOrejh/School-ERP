class StudentModel {
  String? message;
  int? stutas;
  StudentProfile? studentProfile;
  StudentModel({this.message, this.stutas, this.studentProfile});
  StudentModel.fromJson(Map<String, dynamic> jsonData) {
    message = jsonData["message"];
    stutas = jsonData["stutas"];
    studentProfile = StudentProfile.fromJson(jsonData["data"]);
  }
}

class StudentProfile {
  String? scholarNo;
  String? name;
  String? stlass;
  String? house;
  String? fatherName;
  String? motherName;
  String? contactNo;
  String? mobileNo;
  String? email;
  String? address;
  String? image;
  String? attendence;

  StudentProfile({
    this.scholarNo,
    this.name,
    this.stlass,
    this.house,
    this.fatherName,
    this.motherName,
    this.contactNo,
    this.mobileNo,
    this.email,
    this.address,
    this.image,
    this.attendence,
  });
  StudentProfile.fromJson(Map<String, dynamic> stData) {
    scholarNo = stData["scholar_no"];
    name = stData["name"];
    stlass = stData["class"];
    house = stData["house"];
    fatherName = stData["father_name"];
    motherName = stData["mother_name"];
    contactNo = stData["contact_no"];
    mobileNo = stData["mobile_no_sms"];
    email = stData["email"];
    address = stData["address"];
    image = stData["image"];
    attendence = stData["attendance"];
  }

  // "scholar_no": "13577",
  //       "name": "Test",
  //       "class": "HKG - A",
  //       "house": "BLUE",
  //       "father_name": "",
  //       "mother_name": "",
  //       "contact_no": "1111111111",
  //       "mobile_no_sms": "7023708089",
  //       "email": "",
  //       "address": "B 44 VISHNU VIHAR, OPP. RAJASTHAN SADHANA PUBLIC SCHOOL JAGATPURA, JAIPUR",
  //       "image": "https://nauticalerp.itworkshop.in/public/Web Nautical Pvt. Ltd/student-profiles/HKG - A/13577.jpg",
  //       "attendance": "Not Marked"
}
