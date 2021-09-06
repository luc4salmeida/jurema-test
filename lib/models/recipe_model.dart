class RecipeModel {
  final String name;

  RecipeModel({required this.name});

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(name: map['name']);
  }

  static List<RecipeModel> listFromSource(List<dynamic> source) {
    return source.map((e) => RecipeModel.fromMap(e)).toList();
  }
}
