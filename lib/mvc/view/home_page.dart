part of mvc;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {

      return Scaffold(

        appBar: AppBar(
          backgroundColor: Keys.primaryColor,
          title: const Text(
            'List of students',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shadowColor: Colors.grey.shade200,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: controller.hasData,
                  child: Text("No data found")),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async { await controller.getAllStudentsData(); },
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 100),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                    itemCount: controller.studentList.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.deepPurple.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 8, 0, 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)
                                  ),
                                  // child: Image.network("${Keys.baseUrl}/${controller.studentList[index].image}",
                                  //   height: 80,
                                  //   width: 80,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  child:FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/user.png',
                                    image: "${Keys.baseUrl}/${controller.studentList[index].image}",
                                    fit: BoxFit.cover,
                                    height: 80,
                                      width: 80,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    "${controller.studentList[index].firstName} ${controller.studentList[index].lastName}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                   const SizedBox(height: 5),
                                    Text(
                                   controller.studentList[index].dateOfBirth ?? "",
                                    style: const TextStyle(

                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),


                              const SizedBox(
                                width: 10,
                              ),

                              const Spacer(),
                              PopupMenuButton(itemBuilder: (context)=>
                              [
                                 PopupMenuItem(
                                  child: Row(
                                    children: const [
                                      Icon(Icons.edit),
                                      SizedBox(width: 5,),
                                      Text("Edit")
                                    ],
                                  ),
                                  onTap: () {
                                   controller.editStudent(controller.studentList[index]);
                                },
                                 ),
                                 PopupMenuItem(
                                   child: Row(
                                     children: const [
                                       Icon(CupertinoIcons.delete),
                                       SizedBox(width: 5,),
                                       Text("Delete")
                                     ],
                                   ),
                                  onTap: () async{
                                     await Future.delayed(const Duration(milliseconds: 500));
                                    await Get.dialog(
                                         AlertDialog(
                                      title: const Text("warning!"),
                                    content: const Text("Are you sure you want to delete."),
                                        actions: [
                                          TextButton(onPressed: (){
                                            Get.back();
                                          }, child: const Text("NO")),
                                          TextButton(onPressed: () async{
                                            Get.back();
                                            await controller.deleteStudent(controller.studentList[index]);

                                          }, child: const Text("YES")),
                                        ],));
                                  },
                                )
                              ]
                              ),
                            ],
                          ),

                        ),
                      );
                    },
                  ),
                ),
              ),


            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await controller.addNewStudent();
          },
          tooltip: 'Add Student',
          backgroundColor: Keys.primaryColor,
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
