part of core;

abstract class StudentsApi {
  Future<StudentData> getAllStudents();
  Future<StudentData> addStudents(Student student);
  Future<StudentData> editStudents(Student student);
  Future<StudentData> deleteStudents(Student student);
}
