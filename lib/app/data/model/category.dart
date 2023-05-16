class Category {
  int? id;
  String? name;
  String? type;
  DateTime? createAt = DateTime.now();
  DateTime? updateAt = DateTime.now();
  Category({
    this.id,
    this.name,
    this.type,
    this.createAt,
    this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'created_at': createAt?.toIso8601String(),
      'update_at': updateAt?.toIso8601String(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      createAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updateAt: map['update_at'] != null ? DateTime.parse(map['update_at']) : null,
    );
  }

  Category copyWith({
    int? id,
    String? name,
    String? type,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
