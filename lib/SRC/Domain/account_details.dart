class AccountDetailsModel {
  final String accountType;
  final String currency;
  final String branch;
  final String iban;

  AccountDetailsModel({
    required this.accountType,
    required this.currency,
    required this.branch,
    required this.iban,
  });
}
