class PayBillModel {
  final String fromAccount;
  final String toAccount;
  final int amount;
  final DateTime date;

  PayBillModel({
    required this.fromAccount,
    required this.toAccount,
    required this.date,
    required this.amount,
  });
}
