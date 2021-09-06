class UserModel {
  final String name;
  final String title;
  final int followers;
  final int likes;

  UserModel({
    required this.name,
    required this.title,
    required this.followers,
    required this.likes,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      title: map['title'],
      followers: map['followers'],
      likes: map['likes'],
    );
  }
}
