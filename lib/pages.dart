import 'package:get/route_manager.dart';
import 'package:jurema/screens/my_recipes/binding/my_recipes_binding.dart';

import 'routes.dart';
import 'screens/edit_recipe/edit_recipe_screen.dart';
import 'screens/login/binding/login_binding.dart';
import 'screens/login/login_screen.dart';
import 'screens/my_recipes/my_recipes_screen.dart';
import 'screens/user_profile/binding/user_profile_binding.dart';
import 'screens/user_profile/user_profile_screen.dart';

List<GetPage> pages = [
  GetPage(
    name: RouteNames.login,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: RouteNames.userProfile,
    page: () => UserProfileScreen(),
    binding: UserProfileBinding(),
  ),
  GetPage(
    name: RouteNames.myRecipes,
    page: () => MyRecipesScreen(),
    binding: MyRecipesBinding(),
  ),
  GetPage(
    name: RouteNames.editRecipe,
    page: () => EditRecipeScreen(),
  ),
];
