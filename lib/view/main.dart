import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sample_flutter/binding/home_binding.dart';
import 'package:sample_flutter/model/interest_hive.dart';
import 'package:sample_flutter/view/home_view.dart';

import '../app/modules/Dialog/controllers/dialog_controller.dart';
import '../controller/controller.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(InterestHiveAdapter());
  Get.put(DialogController());
  await Hive.openBox<InterestHive>('interest_hive');
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
