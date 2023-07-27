part of mvc;

class AddStudentController extends GetxController {
  AddStudentController() {}
  AddStudentCallBack? callBack;

  final firstNameFormKey = GlobalKey<FormState>();
  final lastNameFormKey = GlobalKey<FormState>();
  final dateOfBirthFormKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var dateController = TextEditingController();
  Student? student;
  bool isFormValidated = false;
  final ImagePicker _picker = ImagePicker();


  File? _file;
  File? get file => _file;
  set file(File? value) {
    _file = value;
    Get.back();
    update();
  }

  bool validateForms() =>
      isFormValidated = (firstNameFormKey.currentState?.validate() ?? false) &
          (lastNameFormKey.currentState?.validate() ?? false) &
          (dateOfBirthFormKey.currentState?.validate() ?? false);

  Future addNewStudent() async {
    try {
      if (isFormValidated) {
        if (file == null) {
          Message.info(title: "error", message: "please add image.");
          return;
        }
        await EasyLoading.show(status: "Please wait");

        var studentRes = await StudentImpl().addStudents(Student(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          dateOfBirth: dateController.text,
          image: file?.path,
        ));

        if (studentRes != null) {
          firstNameController.clear();
          lastNameController.clear();
          dateOfBirthController.clear();
          file = null;
          Message.info(
              title: studentRes.status ?? "",
              message: studentRes.message ?? "");
          await callBack?.call();
          Get.back();
        }
      }
      EasyLoading.dismiss();
    } catch (ex, stack) {
      log(ex.toString() + stack.toString());
    }
  }

  String getCurrentDate() {
    try {
      var date = DateTime.now().toString();

      var dateParse = DateTime.parse(date);

      var formattedDate =
          "${dateParse.day}/${dateParse.month}/${dateParse.year}";
      return formattedDate.toString();
    } catch (ex, stack) {
      log(ex.toString() + stack.toString());
    }
    return "";
  }

  Future takePhoto(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image?.path != null) {
        file = File(image!.path);
      }
    } catch (ex, stack) {
      log(ex.toString() + stack.toString());
    }
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          const Text(
            "Choose profile photo",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    await takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera"),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () async {
                    await takePhoto(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("Gallery"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
