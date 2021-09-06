import 'package:get/get.dart';
import 'package:jurema/screens/user_profile/controller/user_profile_controller.dart';
import 'package:jurema/screens/user_profile/data/user_profile_local_data_source.dart';
import 'package:jurema/screens/user_profile/provider/user_profile_provider.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileLocalDataSource>(
      () => UserProfileLocalDataSourceImpl(),
    );
    Get.lazyPut<UserProfileProvider>(
      () => UserProfileProviderImpl(
        localDataSource: Get.find(),
      ),
    );
    Get.lazyPut(
      () => UserProfileController(
        provider: Get.find(),
      ),
    );
  }
}
