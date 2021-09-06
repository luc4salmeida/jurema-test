class RecipeCategoryModel {
  final String name;

  RecipeCategoryModel({required this.name});

  factory RecipeCategoryModel.fromMap(Map<String, dynamic> map) {
    return RecipeCategoryModel(name: map['name']);
  }

  static List<RecipeCategoryModel> listFromSource(List<dynamic> source) {
    return source.map((e) => RecipeCategoryModel.fromMap(e)).toList();
  }
}
