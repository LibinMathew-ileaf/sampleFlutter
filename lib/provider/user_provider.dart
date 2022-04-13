import 'package:get/get.dart';
class UserProvider extends GetConnect {
  Future<List<dynamic>> getInterests() async {
    final response = await get("https://api.cupidquest.net/interests");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['interests'];
    }
  }
}