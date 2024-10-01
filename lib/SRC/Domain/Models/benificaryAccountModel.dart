class Benificaryaccountmodel {
  final String fromAccount;
  final String toAccount;
  final String? iconPath;
  final String? bankName;
  final String? bankType;

  Benificaryaccountmodel( {
    required this.fromAccount,
    this.iconPath, this.bankName, this.bankType,
    required this.toAccount,

  });
}
