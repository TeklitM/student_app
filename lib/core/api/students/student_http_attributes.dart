part of core;

class GetAllStudentHttpAttribute extends HttpAttribOptions {
  GetAllStudentHttpAttribute()
      : super(
            baseUrl: Keys.baseUrl,
            path: '/student/allStudents',
            method: HttpMethods.GET,
  );
}
class AddStudentHttpAttribute extends HttpAttribOptions {
  AddStudentHttpAttribute(Map<String,String> fields,Map<String, List<int>>? file)
      : super(
      baseUrl: Keys.baseUrl,
      path: '/student/addStudent',
      method: HttpMethods.POST,
      fields: fields,
    files: file
  );
}
class EditStudentHttpAttribute extends HttpAttribOptions {
  EditStudentHttpAttribute(Map<String,String> fields,Map<String, List<int>>? file)
      : super(
      baseUrl: Keys.baseUrl,
      path: '/student/updateStudent',
      method: HttpMethods.POST,
      fields: fields,
      files: file
  );
}
class DeleteStudentHttpAttribute extends HttpAttribOptions {
  DeleteStudentHttpAttribute(Map<String,String> fields,Map<String, List<int>>? file)
      : super(
      baseUrl: Keys.baseUrl,
      path: '/student/deleteStudent',
      method: HttpMethods.POST,
      fields: fields,
      files: file
  );
}
