
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sample_flutter/controller/home_controller.dart';

class EnterNameScreen extends GetView<HomeController>{
  const EnterNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: const [
        Spacer(),
        Text("data"),

    TextField(
          decoration: InputDecoration(
          border: OutlineInputBorder(),
      labelText: 'User Name',
      hintText: 'Enter Your Name',
    ))
      ],),
    );
  }
}