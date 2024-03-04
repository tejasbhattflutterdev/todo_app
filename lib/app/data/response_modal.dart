class LoginResponseModal {
  String? status;
  int? errorCode;
  String? msg;
  List<Data>? data;

  LoginResponseModal({this.status, this.errorCode, this.msg, this.data});

  LoginResponseModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error_code'] = errorCode;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? employeeId;
  String? name;
  int? postId;
  String? postName;
  String? trxId;

  Data({this.employeeId, this.name, this.postId, this.postName, this.trxId});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['Employee_id'];
    name = json['Name'];
    postId = json['Post_id'];
    postName = json['Post_name'];
    trxId = json['trx_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Employee_id'] = employeeId;
    data['Name'] = name;
    data['Post_id'] = postId;
    data['Post_name'] = postName;
    data['trx_id'] = trxId;
    return data;
  }
}
