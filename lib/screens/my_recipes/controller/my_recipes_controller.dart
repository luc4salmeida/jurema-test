import 'package:get/get.dart';
import 'package:jurema/models/recipe_model.dart';
import 'package:jurema/routes.dart';
import 'package:jurema/screens/my_recipes/provider/my_recipes_provider.dart';

class MyRecipesController extends GetxController {
  final MyRecipesProvider provider;

  MyRecipesController({required this.provider});

  late List<RecipeModel> recipes;
  late String categoryId;
  late RxBool loading;
  late RxBool startAnimation;

  @override
  void onInit() {
    categoryId = Get.arguments;
    loading = false.obs;
    startAnimation = false.obs;
    recipes = [];

    super.onInit();
  }

  @override
  void onReady() {
    _initialFetch();
    super.onReady();
  }

  Future<void> _initialFetch() async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    recipes = await provider.fetchRecipesByCategoryId(id: categoryId);
    _setLoading(false);

    startAnimation.toggle();
  }

  void _setLoading(bool status) {
    loading.value = status;
  }

  void onRecipePressed(RecipeModel model) {
    Get.toNamed(RouteNames.editRecipe);
  }
}
