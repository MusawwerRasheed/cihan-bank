class Benficarymodel {
  final String name;
  final String bankACCOUNT;
  final String accountCode;
  final String? iconPath;
  final String? bankName;
  final String? bankType;

//  final DateTime date;

  Benficarymodel(  {
    required this.name,
    this.bankType,
    this.iconPath, this.bankName,
    required this.bankACCOUNT,
    required this.accountCode,

  });
}
