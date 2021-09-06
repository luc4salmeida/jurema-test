import 'package:get/get.dart';
import 'package:jurema/screens/my_recipes/controller/my_recipes_controller.dart';
import 'package:jurema/screens/my_recipes/data/my_recipes_local_data_source.dart';
import 'package:jurema/screens/my_recipes/provider/my_recipes_provider.dart';

class MyRecipesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRecipesLocalDataSource>(() => MyRecipesLocalDataSourceImpl());
    Get.lazyPut<MyRecipesProvider>(
      () => MyRecipesProviderImpl(localDataSource: Get.find()),
    );
    Get.lazyPut(() => MyRecipesController(provider: Get.find()));
  }
}
