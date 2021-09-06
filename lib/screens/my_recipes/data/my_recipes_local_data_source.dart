import 'package:flutter/services.dart';

abstract class MyRecipesLocalDataSource {
  Future<String> fetchRecipesByCategoryId({required id});
}

class MyRecipesLocalDataSourceImpl implements MyRecipesLocalDataSource {
  Future<String> _readJsonFile(String asset) async {
    final String response =
        await rootBundle.loadString('assets/json/$asset.json');
    return response;
  }

  @override
  Future<String> fetchRecipesByCategoryId({required id}) {
    return _readJsonFile('recipes');
  }
}
