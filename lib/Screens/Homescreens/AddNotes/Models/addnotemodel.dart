class AddNoteModel {
  String? message;
  Data? data;

  AddNoteModel({this.message, this.data});

  AddNoteModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? user;
  String? note;
  String? sId;
  String? created;
  int? iV;

  Data({this.user, this.note, this.sId, this.created, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    note = json['note'];
    sId = json['_id'];
    created = json['created'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['note'] = this.note;
    data['_id'] = this.sId;
    data['created'] = this.created;
    data['__v'] = this.iV;
    return data;
  }
}
