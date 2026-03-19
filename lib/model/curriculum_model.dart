class NoticeModel {
  String? asseetUrl;
  int? status;
  List<AllNotice>? genaralNotice;
  List<AllNotice>? classNotice;

  NoticeModel({
    this.asseetUrl,
    this.status,
    this.classNotice,
    this.genaralNotice,
  });

  NoticeModel.fromJson(Map<String, dynamic> allNotice) {
    asseetUrl = allNotice["noticesAssetUrl"];
    status = allNotice["status"];
    classNotice = allNotice["classwise_notice"] != null
        ? List<AllNotice>.from(
            allNotice["classwise_notice"].map((e) => AllNotice.fromJson(e)),
          )
        : [];
    genaralNotice = allNotice["general_notice"] != null
        ? List<AllNotice>.from(
            allNotice["general_notice"].map((e) => AllNotice.fromJson(e)),
          )
        : [];
  }
}

class AllNotice {
  int? id;
  int? schoolId;
  String? title;
  String? description;
  String? type;
  List<String>? classRange;
  String? classes;
  String? noticeBy;
  String? createdAt;
  String? updatedAt;
  List<Attachment>? attachments;
  AllNotice({
    this.attachments,
    this.classRange,
    this.classes,
    this.createdAt,
    this.description,
    this.id,
    this.noticeBy,
    this.schoolId,
    this.title,
    this.type,
    this.updatedAt,
  });
  AllNotice.fromJson(Map<String, dynamic> allNotice) {
    id = allNotice["id"];
    schoolId = allNotice["school_id"];
    title = allNotice["title"];
    description = allNotice["description"];
    type = allNotice["type"];

    classRange = allNotice["class_range"] != null
        ? List<String>.from(allNotice["class_range"])
        : null;
    classes = allNotice["classes"] ?? "";
    noticeBy = allNotice["notice_by"];
    createdAt = allNotice["created_at"];
    updatedAt = allNotice["updated_at"];
    attachments = allNotice["attachments"] != null
        ? List<Attachment>.from(
            allNotice["attachments"].map((e) => Attachment.fromJson(e)),
          )
        : null;
  }
}

class Attachment {
  int? id;
  int? schoolId;
  int? noticeId;
  String? filePath;
  String? type;
  String? createdAt;
  String? updatedAt;

  Attachment({
    this.id,
    this.schoolId,
    this.noticeId,
    this.filePath,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  Attachment.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    schoolId = json["school_id"];
    noticeId = json["notice_id"];
    filePath = json["file_path"];
    type = json["type"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }
}
