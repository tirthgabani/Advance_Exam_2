class UserData {
  String? Name, Post;
  int? Age;

  UserData({required this.Name, required this.Age, required this.Post});

  UserData.fromMap(Map<String, dynamic> map) {
    Name = map[Name];
    Age = map[Age];
    Post = map[Post];
  }

  Map<String, dynamic> toMap() => {
        'Name': Name,
        'Age': Age,
        'Post': Post,
      };
}
