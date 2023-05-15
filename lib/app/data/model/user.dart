class User {
  String? id;
  String? name;
  DateTime? createAt;
  DateTime? updateAt;

  User({
    this.id,
    this.name,
    this.createAt,
    this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'create_at': createAt?.millisecondsSinceEpoch,
      'update_at': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      createAt: map['create_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['create_at'] as int) : null,
      updateAt: map['update_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['update_at'] as int) : null,
    );
  }
}
