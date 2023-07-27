part of mvc;


typedef AddStudentCallBack = Future Function();
class AddStudent extends StatelessWidget {
  AddStudent({super.key,required AddStudentCallBack callBack}) {
    Get.put(AddStudentController());
    var addStudentController = Get.find< AddStudentController>();
    addStudentController.callBack = callBack;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddStudentController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Keys.primaryColor,
            title: const Text(
              'Add students',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            shadowColor: Colors.grey.shade200,
            elevation: 1,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              // child: Card(
              //   shadowColor: Colors.grey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                       CircleAvatar(
                        radius: 80,
                        foregroundImage: controller.file == null ?
                        const AssetImage('assets/images/user.png')
                          : FileImage(controller.file!)as ImageProvider,
                      ),
                      Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: GestureDetector(
                            onTap: () {
                              Get.bottomSheet(controller.bottomSheet(context));
                              //
                            },
                            child: const Icon(Icons.add_a_photo,
                            color: Keys.accentColor,),
                          ))
                    ],
                  ),
                  const SizedBox(height: 30,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 5, left: 10),
                          child: Form(
                            key: controller.firstNameFormKey,
                            child: TextFormField(
                              controller: controller.firstNameController,
                              cursorColor: Colors.black,
                              cursorWidth: 2,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "first name is required";
                                }
                                if (!GetUtils.isAlphabetOnly(value)) {
                                  return 'Invalid first name'.tr;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  color: Keys.errorColor,
                                  fontSize: 10,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5.0),
                                border: OutlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                                label: Text('First Name'),
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              onChanged: (value) {
                                if (controller.isFormValidated) {
                                  controller.firstNameFormKey.currentState?.validate() ??
                                      false;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 5, left: 10),
                          child: Form(
                            key: controller.lastNameFormKey,
                            child: TextFormField(
                              controller: controller.lastNameController,
                              cursorColor: Colors.black,
                              cursorWidth: 2,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Last name is required";
                                }
                                if (!GetUtils.isAlphabetOnly(value)) {
                                  return 'Invalid Last name'.tr;
                                }

                                return null;
                              },
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  color: Keys.errorColor,
                                  fontSize: 10,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5.0),
                                border: OutlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                                label: Text('Last Name'),
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              onChanged: (value) {
                                if (controller.isFormValidated) {
                                  controller.lastNameFormKey.currentState?.validate() ??
                                      false;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.calendar_month, color: Colors.grey),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Form(
                            key: controller.dateOfBirthFormKey,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(top: 5, left: 10),
                              child: TextFormField(

                                controller:
                                controller.dateController,
                                readOnly: true,
                                onTap: () async {
                                  // DateTime? pickedDate = await
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(DateTime.now().year - 1),
                                    lastDate: DateTime.now(),
                                    initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
                                    // helpText: DateTime.now().toString(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme:  const ColorScheme.highContrastLight(
                                            primary: Keys.secondaryColor, // header background color
                                            onPrimary: Colors
                                                .white, // header text color
                                            onSurface: Colors
                                                .black, // body text color
                                          ),
                                          textButtonTheme:
                                          TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors
                                                  .purpleAccent, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      controller.dateController.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(selectedDate);
                                    }
                                  });
                                  validator:(value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter date of birth.';
                                    }
                                    return null;
                                  };
                                },
                                decoration: InputDecoration(
                                  // labelText: "Date of birth",
                                  hintText: controller.getCurrentDate(),
                                  hintStyle: const TextStyle(
                                    color: Colors
                                        .black87,
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                  floatingLabelStyle:
                                  const TextStyle(
                                    color: Keys
                                        .mediumTextColor,
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors
                                        .grey.shade500,
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.normal,
                                  ),
                                  focusedBorder:
                                  UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .grey.shade200,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder:
                                  UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .grey.shade200,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                      text: 'Add Student',
                      context: context,
                      showLoading: true,
                      onPressed: () async {
                        if (controller.validateForms()) {
                          await controller.addNewStudent();
                        }
                      }),
                ],
              ),
              // ),
            ),
          ));
    });
  }


}
