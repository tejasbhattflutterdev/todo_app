class PersonalTodoResponse {
  String? status;
  int? errorCode;
  String? msg;
  List<Data>? data;

  PersonalTodoResponse({this.status, this.errorCode, this.msg, this.data});

  PersonalTodoResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? employeeId;
  int? managerId;
  String? createdDate;
  String? work;
  int? deadline;
  String? completionDate;
  String? isdeleted;
  String? reason;
  String? updatedDate;
  String? employeeName;
  String? managerName;

  Data(
      {this.id,
      this.employeeId,
      this.managerId,
      this.createdDate,
      this.work,
      this.deadline,
      this.completionDate,
      this.isdeleted,
      this.reason,
      this.updatedDate,
      this.employeeName,
      this.managerName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    managerId = json['manager_id'];
    createdDate = json['created_date'];
    work = json['work'];
    deadline = json['deadline'];
    completionDate = json['completion_date'];
    isdeleted = json['isdeleted'];
    reason = json['reason'];
    updatedDate = json['updated_date'];
    employeeName = json['employee_name'];
    managerName = json['manager_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employee_id'] = employeeId;
    data['manager_id'] = managerId;
    data['created_date'] = createdDate;
    data['work'] = work;
    data['deadline'] = deadline;
    data['completion_date'] = completionDate;
    data['isdeleted'] = isdeleted;
    data['reason'] = reason;
    data['updated_date'] = updatedDate;
    data['employee_name'] = employeeName;
    data['manager_name'] = managerName;
    return data;
  }
}
