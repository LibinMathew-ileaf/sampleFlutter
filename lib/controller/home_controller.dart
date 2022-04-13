import 'package:get/get.dart';
import 'package:sample_flutter/provider/user_provider.dart';
class HomeController extends GetxController with StateMixin<List<dynamic>> {


  @override
  void onInit() {
    super.onInit();
    UserProvider().getInterests().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }
}
