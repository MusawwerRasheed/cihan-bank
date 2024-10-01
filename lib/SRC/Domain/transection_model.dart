class Transaction {
  final String title;
  final String amount;
  final String date;
  final bool isDebit;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.isDebit,
  });
}
