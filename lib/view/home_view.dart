import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sample_flutter/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: const Text("Interests"),
        ),
        body: controller.obx(
              (data) =>
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              data[index]['name'],
                            ),
                            subtitle: Text(
                              data[index]['id'],
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