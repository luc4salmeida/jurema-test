import 'dart:convert';

import 'package:jurema/models/recipe_model.dart';
import 'package:jurema/screens/my_recipes/data/my_recipes_local_data_source.dart';

abstract class MyRecipesProvider {
  Future<List<RecipeModel>> fetchRecipesByCategoryId({required String id});
}

class MyRecipesProviderImpl implements MyRecipesProvider {
  final MyRecipesLocalDataSource localDataSource;

  MyRecipesProviderImpl({required this.localDataSource});

  @override
  Future<List<RecipeModel>> fetchRecipesByCategoryId({
    required String id,
  }) async {
    final response = await localDataSource.fetchRecipesByCategoryId(id: id);
    final data = json.decode(response);
    return RecipeModel.listFromSource(data[id]);
  }
}
