import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sample_flutter/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ),
        appBar: AppBar(

          title: const Text("Interests"),
        ),
        body: Obx(() =>
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

                          ),
                        ],
                      ),
                    );
                  }),
        )
    );
  }
}