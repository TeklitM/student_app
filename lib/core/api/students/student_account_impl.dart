part of core;

class StudentImpl extends StudentsApi {
  @override
  Future<StudentData> getAllStudents() async {
    try {
      String? response = await UtilDependency.httpService
          .get(GetAllStudentHttpAttribute());
      if (response != null) {
        return _$StudentDataFromJson(json.decode(response));
      } else {
        return StudentData();
      }
    } catch (ex) {
      return StudentData();
    }
  }
  @override
  Future<StudentData> addStudents(Student student) async {
    try {
      Map<String,List<int>> image = {student.image ?? "": await File(student.image ?? "").readAsBytes()};
      String? response = await UtilDependency.httpService
          .post(AddStudentHttpAttribute(student.toJson(),image));
      if (response != null) {
        return _$StudentDataFromJson(json.decode(response));
      } else {
        return StudentData();
      }
    } catch (ex) {
      return StudentData();
    }
  }
  @override
  Future<StudentData> editStudents(Student student) async {
    try {
      Map<String,List<int>>? image = student.image !=null ? {student.image ?? "": await File(student.image ?? "").readAsBytes()} :null;
      String? response = await UtilDependency.httpService
          .post(EditStudentHttpAttribute(student.toJson(),image));
      if (response != null) {
        return _$StudentDataFromJson(json.decode(response));
      } else {
        return StudentData();
      }
    } catch (ex) {
      return StudentData();
    }
  }
  @override
  Future<StudentData> deleteStudents(Student student) async {
    try {
      // Map<String,List<int>> image = {student.image ?? "": await File(student.image ?? "").readAsBytes()};
      String? response = await UtilDependency.httpService
          .post(DeleteStudentHttpAttribute({"id":student.id ?? ""},null));
      if (response != null) {
        return _$StudentDataFromJson(json.decode(response));
      } else {
        return StudentData();
      }
    } catch (ex) {
      return StudentData();
    }
  }


}
