import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sample_flutter/model/interest_hive.dart';
import 'package:sample_flutter/provider/user_provider.dart';
class HomeController extends GetxController {
  var allInterest = <InterestHive>[].obs;
  var error = "".obs;
  @override
  void onInit() {
    super.onInit();
    UserProvider().getInterests().then((resp) async {
      try{
        await deleteAll();
        debugPrint('delete: completed');
        addAllInterests(resp);
        debugPrint('added: completed');
        allInterest.value = getAll();
        debugPrint('listed: completed');
      }
      catch( e ){
        debugPrint('error: ${e.toString()}');
        error.value=e.toString();
      }

    }, onError: (err) {
       error.value=err;
    });
  }

  void addAllInterests(List<dynamic> list) {
    final box = Hive.box<InterestHive>('interest_hive');
    var listInterestHive = <InterestHive>[];
    for (var element in list) {
      final interests = InterestHive()
        ..name = element['name']
        ..id = element['id']
        ..createdAt = element['updatedAt']
        ..updatedAt = element['createdAt']
        ..icon = element['icon'];
      listInterestHive.add(interests);
    }

    box.addAll(listInterestHive);
  }

  void addInterests(String name, String icon, String id)  {
    final interests = InterestHive()
      ..name = name
      ..id=id
      ..createdAt = DateTime.now().millisecond
      ..updatedAt = DateTime.now().millisecond
      ..icon = icon;

    final box =  Hive.box<InterestHive>('interest_hive');
    box.add(interests);
    allInterest.value=getAll();
    //box.put('mykey', interests);

    // final mybox = Boxes.getinterestss();
    // final myinterests = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  void editInterest(
      InterestHive interests,
      String name,
      String id,
      String  icon,
      ) {
    interests.name = name;
    interests.id = id;
    interests.updatedAt = DateTime.now().millisecond;
    interests.icon=icon;
    interests.save();
  }

  Future<void> deleteInterests(InterestHive interests) async{
   await interests.delete();
   allInterest.value=getAll();
  }
  Future<void> deleteAll() async{
    final box = Hive.box<InterestHive>('interest_hive');
    await box.clear();
  }
  List<InterestHive> getAll(){
  final box = Hive.box<InterestHive>('interest_hive');
  return box.values.toList();
  }

  Future<void> updateInterests(InterestHive interestHive,String name) async {
    Box box =  Hive.box<InterestHive>('interest_hive');

    final modelExists = box.containsKey(interestHive.key);

    if (modelExists) {
      interestHive.name = name;
      interestHive.save();
    }
    allInterest.value=getAll();
  }
}
