import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AccountInfoCard extends StatelessWidget {
  final AccountDetailsModel accountDetails;

  const AccountInfoCard({super.key, required this.accountDetails});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Chip(
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountDetailWidget(
            title: 'Account type',
            value: accountDetails.accountType,
          ),
          AccountDetailWidget(
            title: 'Currency',
            value: accountDetails.currency,
            color: themeData.colorScheme.onTertiary,
          ),
          AccountDetailWidget(
            title: 'Branch',
            value: accountDetails.branch,
          ),
          AccountDetailWidget(
            title: 'IBAN',
            value: accountDetails.iban,
          ),
        ],
      ),
    );
  }
}
