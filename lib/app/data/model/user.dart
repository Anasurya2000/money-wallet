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
      'created_at': createAt?.millisecondsSinceEpoch.toString(),
      'update_at': updateAt?.millisecondsSinceEpoch.toString(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      // createAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
      // updateAt: map['update_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['update_at']) : null,
    );
  }
}
