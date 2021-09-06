import 'package:flutter/services.dart';

abstract class UserProfileLocalDataSource {
  Future<String> fetchUserData();
  Future<String> fetchMyRecipes();
}

class UserProfileLocalDataSourceImpl implements UserProfileLocalDataSource {
  Future<String> _readJsonFile(String asset) async {
    final String response =
        await rootBundle.loadString('assets/json/$asset.json');
    return response;
  }

  @override
  Future<String> fetchMyRecipes() async {
    return _readJsonFile('recipe_categories');
  }

  @override
  Future<String> fetchUserData() async {
    return _readJsonFile('user');
  }
}
