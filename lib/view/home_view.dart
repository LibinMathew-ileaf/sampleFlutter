import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter/controller/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
             openDialog(context, "Add","","",onSave: (name,id){
               controller.addInterests(name, "icon", id);
             },isForEdit: false);
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(

            title: const Text("Interests"),
          ),
          body:
                ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.allInterest.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                (controller.allInterest[index]).name!,
                              ),
                              subtitle: Text(
                                (controller.allInterest[index]).id!,
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing:  SizedBox(
                                height: 100,
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                        size: 30.0,
                                      ), onPressed: () {
                                      openDialog(
                                    context,
                                    "Edit",
                                    controller.allInterest![index].name!,
                                    controller.allInterest[index].id!,
                                    onSave: (name, id) async{
                                    controller.updateInterests(controller.allInterest![index], name);
                                    },
                                    isForEdit: true);
                              },
                                    ),IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 30.0,
                                      ), onPressed: () async {
                                      controller.deleteInterests(controller.allInterest[index]);
                                    },
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                      );
                    }),

      ),
    );
  }
}







openDialog(BuildContext context, String title, String name, String id,
    {required void Function(String name ,String id) onSave,required bool isForEdit}) {
  final nameController = TextEditingController(text: name);
  final idController = TextEditingController(text: id);
  final formKey = GlobalKey<FormState>();
  String text = "";
  if(isForEdit) {
    text="Edit";
  } else {
    text="Save";
  }
  Get.dialog(
    AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
                validator: (name) =>
                name != null && name.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 8),
              if(!isForEdit)TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Id',
                ),
                keyboardType: TextInputType.text,
                validator: (id) => id != null
                    ? 'Enter a valid id'
                    : null,
                controller: idController,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
            child: Text(text),
            onPressed: () async {
              onSave(nameController.text,idController.text);
              Navigator.of(context).pop();
            }),
      ],
    ),
  );
}