// ignore_for_file: public_member_api_docs, sort_constructors_first

class Transactions {
  int id;
  double amount;
  int date;
  bool isIncome;
  int categoryId;
  DateTime? createAt;
  DateTime? updateAt;

  Transactions({
    required this.id,
    required this.amount,
    required this.categoryId,
    required this.date,
    required this.isIncome,
    this.createAt,
    this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'date': date,
      'isIncome': isIncome,
      'categoryId': categoryId,
      'create_at': createAt?.millisecondsSinceEpoch,
      'update_at': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory Transactions.fromMap(Map<String, dynamic> map) {
    return Transactions(
      id: map['id'] as int,
      amount: map['amount'] as double,
      date: map['date'] as int,
      isIncome: map['isIncome'] as bool,
      categoryId: map['categoryId'] as int,
      createAt: map['create_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['create_at'] as int) : null,
      updateAt: map['update_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['update_at'] as int) : null,
    );
  }
}
