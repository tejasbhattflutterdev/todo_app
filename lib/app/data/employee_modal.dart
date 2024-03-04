class EmployeeModal {
  String? status;
  int? errorCode;
  String? msg;
  List<Data>? data;

  EmployeeModal({this.status, this.errorCode, this.msg, this.data});

  EmployeeModal.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? phone;
  String? joiningDate;
  int? postId;
  int? departmentId;
  String? createdDate;
  String? updatedDate;

  Data(
      {this.employeeId,
      this.name,
      this.email,
      this.phone,
      this.joiningDate,
      this.postId,
      this.departmentId,
      this.createdDate,
      this.updatedDate});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    joiningDate = json['joining_date'];
    postId = json['post_id'];
    departmentId = json['department_id'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['joining_date'] = joiningDate;
    data['post_id'] = postId;
    data['department_id'] = departmentId;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    return data;
  }
}
