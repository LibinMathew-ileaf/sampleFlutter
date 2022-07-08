import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sample_flutter/interest_response.dart';
import 'package:sample_flutter/model/interest_hive.dart';
import 'package:sample_flutter/provider/user_provider.dart';
class HomeController extends GetxController {
  var allInterest = <InterestHive>[].obs;
  var error = "".obs;
  @override
  void onInit() {
    super.onInit();
    UserProvider().getInterests().then((resp) {
      try{
        deleteAll();
        addAllInterests(resp);
        allInterest.value=getAll();
      }
      catch( e ){
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

  void deleteInterests(InterestHive interests) {
    interests.delete();
  }
  void deleteAll(){
    final box = Hive.box<InterestHive>('interest_hive');
    box.clear();
  }
  List<InterestHive> getAll(){
  final box = Hive.box<InterestHive>('interest_hive');
  return box.values.toList();
  }
}
