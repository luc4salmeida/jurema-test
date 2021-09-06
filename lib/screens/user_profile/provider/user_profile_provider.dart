import 'dart:convert';

import 'package:jurema/models/recipe_category.dart';
import 'package:jurema/models/user_model.dart';
import 'package:jurema/screens/user_profile/data/user_profile_local_data_source.dart';

abstract class UserProfileProvider {
  Future<UserModel> fetchUser();
  Future<List<RecipeCategoryModel>> fetchRecipeCategories();
}

class UserProfileProviderImpl implements UserProfileProvider {
  final UserProfileLocalDataSource localDataSource;

  UserProfileProviderImpl({required this.localDataSource});

  @override
  Future<List<RecipeCategoryModel>> fetchRecipeCategories() async {
    final response = await localDataSource.fetchMyRecipes();
    final data = json.decode(response);
    return RecipeCategoryModel.listFromSource(data['categories']);
  }

  @override
  Future<UserModel> fetchUser() async {
    final response = await localDataSource.fetchUserData();
    final data = json.decode(response);
    return UserModel.fromMap(data);
  }
}
