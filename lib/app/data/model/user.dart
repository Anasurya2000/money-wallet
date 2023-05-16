class User {
  String? id;
  String? name;
  User({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
    );
  }
}
