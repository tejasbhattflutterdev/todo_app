class insert_todo_modal {
  int? employeeId;
  int? managerId;
  String? createdDate;
  String? work;
  int? deadline;
  String? completionDate;
  String? isdeleted;
  String? reason;

  insert_todo_modal(
      {this.employeeId,
      this.managerId,
      this.createdDate,
      this.work,
      this.deadline,
      this.completionDate,
      this.isdeleted,
      this.reason});

  insert_todo_modal.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    managerId = json['manager_id'];
    createdDate = json['created_date'];
    work = json['work'];
    deadline = json['deadline'];
    completionDate = json['completion_date'];
    isdeleted = json['isdeleted'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['manager_id'] = managerId;
    data['created_date'] = createdDate;
    data['work'] = work;
    data['deadline'] = deadline;
    data['completion_date'] = completionDate;
    data['isdeleted'] = isdeleted;
    data['reason'] = reason;
    return data;
  }
}
