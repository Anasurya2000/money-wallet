class Transactions {
  int? id;
  double? amount;
  int? date;
  bool? isIncome;
  int? categoryId;
  DateTime? createAt;
  DateTime? updateAt;

  Transactions({
    this.id,
    this.amount,
    this.categoryId,
    this.date,
    this.isIncome,
    this.createAt,
    this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'date': date,
      'isIncome': isIncome != null ? (isIncome! ? 1 : 0) : null,
      'categoryId': categoryId,
      'create_at': createAt?.toIso8601String(),
      'update_at': updateAt?.toIso8601String(),
    };
  }

  factory Transactions.fromMap(Map<String, dynamic> map) {
    return Transactions(
      id: map['id'] as int,
      amount: map['amount'],
      date: map['date'],
      isIncome: map['isIncome'] == 1 ? true : false,
      categoryId: map['categoryId'],
      createAt: map['create_at'] != null ? DateTime.parse(map['create_at']) : null,
      updateAt: map['update_at'] != null ? DateTime.parse(map['update_at']) : null,
    );
  }
}
