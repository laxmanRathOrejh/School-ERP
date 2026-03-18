class FessHistModel {
String? message;
int? stutas;
List<FessData>? fessData;

FessHistModel({this.message,this.stutas,this.fessData});
FessHistModel.fromJson(Map<String,dynamic>json){
  message =json["message"];
  stutas = json["status"];
  fessData= (json["data"]as List?)?.map((e)=>FessData.fromJson(e)).toList();
}
}

class FessData {
String? studentName;
String? stclass; 
String? regNo;
int? schoolSession;
String? quarter;
String? reciptNo;
int? invoiceId;
String? paymentDate;
String? paymentMode;
int? amount;
int?lateFess;
int ? total;
String? trantionId;

FessData({this.studentName,this.stclass,this.regNo,this.schoolSession,this.quarter,this.reciptNo,this.invoiceId,this.paymentDate,
this.paymentMode,this.amount,this.total,this.lateFess,this.trantionId
});
FessData.fromJson(Map<String,dynamic>stFessData){
  studentName = stFessData["student_name"];
 stclass= stFessData["class"]; 
regNo= stFessData["regNo"];
 schoolSession= stFessData["school_session"];
 quarter= stFessData["quarter"];
 reciptNo= stFessData["receipt_number"];
invoiceId= stFessData["invoice_id"];
 paymentDate= stFessData["payemnt_date"];
paymentMode= stFessData["payment_mode"];
amount= stFessData["amount"];
lateFess= stFessData["late_fees"];
total= stFessData["total"];
trantionId= stFessData["transaction_id"];

}

}
