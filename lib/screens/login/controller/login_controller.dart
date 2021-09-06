import 'package:get/get.dart';
import 'package:jurema/routes.dart';

class LoginController extends GetxController {
  late RxBool loading;

  @override
  void onInit() {
    loading = false.obs;
    super.onInit();
  }

  void onLoginPressed() async {
    _setLoading(true);
    await Future.delayed(Duration(seconds: 1));
    Get.offAllNamed(RouteNames.userProfile);
    _setLoading(false);
  }

  void _setLoading(bool status) {
    loading.value = status;
  }
}
