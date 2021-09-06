import 'package:get/get.dart';
import 'package:jurema/models/recipe_category.dart';
import 'package:jurema/models/user_model.dart';
import 'package:jurema/routes.dart';
import 'package:jurema/screens/user_profile/provider/user_profile_provider.dart';

class UserProfileController extends GetxController {
  final UserProfileProvider provider;
  UserProfileController({required this.provider});

  UserModel? user;
  late List<RecipeCategoryModel> recipeCategories;

  late RxBool loading;
  late RxBool startAnimation;

  @override
  void onInit() {
    loading = false.obs;
    startAnimation = false.obs;
    recipeCategories = [];
    _initialFetch();
    super.onInit();
  }

  Future<void> _initialFetch() async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    user = await provider.fetchUser();
    recipeCategories = await provider.fetchRecipeCategories();
    _setLoading(false);

    startAnimation.toggle();
  }

  void _setLoading(bool status) {
    loading.value = status;
  }

  void onRecipeCategoryPressed(RecipeCategoryModel model) {
    Get.toNamed(RouteNames.myRecipes, arguments: model.name);
  }
}
