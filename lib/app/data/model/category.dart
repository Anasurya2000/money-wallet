// ignore_for_file: public_member_api_docs, sort_constructors_first

class Category {
  int? id;
  String? name;
  String? type;
  DateTime? createAt;
  DateTime? updateAt;
  Category({
    this.id,
    this.name,
    this.type,
    this.createAt,
    this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'create_at': createAt?.millisecondsSinceEpoch,
      'update_at': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      createAt: map['create_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['create_at'] as int) : null,
      updateAt: map['update_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['update_at'] as int) : null,
    );
  }
}
