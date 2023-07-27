part of mvc;

class HomeController extends GetxController {
  HomeController() {
    Future.delayed(const Duration(seconds:1)).then((value) => getAllStudentsData());

  }
  List<Student> _studentList = [];
  List<Student>  get studentList => _studentList;
  set studentList(List<Student> value){
    _studentList = value;
    update();
  }
  bool _hasData = false;
  bool get hasData =>_hasData;
  set hasData(bool value){
    _hasData=value;
    update();
  }
  Future getAllStudentsData() async {
    try {
        await EasyLoading.show(status: "Please wait");
        studentList = [];
        StudentData studentRes = await StudentImpl().getAllStudents();

        if (studentRes.status == "SUCCESS" && studentRes.students !=null && studentRes.students?.length != 0) {
          studentList = studentRes.students ?? [];
          hasData = false;
        }
        else{
          hasData =true;
        }

EasyLoading.dismiss();
    } catch (ex, stack) {
      log(ex.toString() + stack.toString());
    }
  }
  Future addNewStudent() async {
    try {
      Get.to(AddStudent(callBack:getAllStudentsData,));
    } catch (ex, stack) {
      log(ex.toString() + stack.toString());
    }
    }

  Future editStudent(Student student) async {

    await Future.delayed(const Duration(seconds: 1),);
    Get.to(() => EditStudentPage(student: student));

  }
Future deleteStudent(Student student) async {
  try {
    await EasyLoading.show(status: "Please wait");

    var studentRes = await StudentImpl().deleteStudents(student);


    if (studentRes != null) {
      Message.info(
          title: studentRes.status ?? "", message: studentRes.message ?? "");
      await getAllStudentsData();
    }
    EasyLoading.dismiss();
  } catch (ex, stack) {
    log(ex.toString() + stack.toString());
  }
}

}
