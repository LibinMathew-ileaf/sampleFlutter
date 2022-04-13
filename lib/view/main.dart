import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter/binding/home_binding.dart';
import 'package:sample_flutter/view/home_view.dart';

import '../controller/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding:HomeBinding() ,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller c = Get.find();

  void _incrementCounter() {
    c.increment();

  }

  @override
  Widget build(BuildContext context) {
    return const HomeView(key:Key("home"));
  }
}
