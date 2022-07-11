import 'package:get/get.dart';

import '../modules/Dialog/bindings/dialog_binding.dart';
import '../modules/Dialog/views/dialog_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.DIALOG,
      page: () => DialogView(),
      binding: DialogBinding(),
    ),
  ];
}
