enum MethodType {
  get,
  post,
  put,
  delete,
}

class ApiUrls {
  static const baseURL = "http://192.168.60.101:61000/rupiya/v1";
  static const loginUrl = "$baseURL/employee/login";
  static const logoutUrl = "$baseURL/employee/logout";
  static const getAllEmployee = "$baseURL/employee_id/name/get_all";
  static const addToDo = "$baseURL/todo/insert";
  static const getPersonalToDo = "$baseURL/todo/get_todo_by_id/";
  static const deleteToDo = "$baseURL/todo/delete";
  static const updateToDo = "$baseURL/todo/update";
}
