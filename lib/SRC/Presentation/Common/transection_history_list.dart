import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/transection_model.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/tile_button.dart';

class TransactionHistoryList extends StatelessWidget {
  TransactionHistoryList({
    super.key,
  });

  final List<Transaction> transactions = [
    Transaction(
      title: 'Online Payment Adobe',
      amount: '- 20 IQD',
      date: 'Jan 15, 2024',
      isDebit: true,
    ),
    Transaction(
      title: 'Received from Rami',
      amount: '+ 60 IQD',
      date: 'Sep 15, 2024',
      isDebit: false,
    ),
    Transaction(
      title: 'Sent from Rami',
      amount: '+ 60 IQD',
      date: 'Aug 15, 2024',
      isDebit: false,
    ),
    Transaction(
      title: 'Online Payment Adobe',
      amount: '- 20 IQD',
      date: 'Sep 15, 2024',
      isDebit: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final transaction = transactions[index];

          return TileButton(
            leading: Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                    color: transaction.isDebit
                        ? themeData.colorScheme.error
                        : themeData.colorScheme.inverseSurface,
                    shape: BoxShape.circle),
                child: Center(
                  child: AssetImageWidget(
                    url: index == 2
                        ? Assets.icons.arrowUpIcon
                        : (transaction.isDebit
                            ? Assets.icons.adobeIcon
                            : Assets.icons.arroowDownIcon),
                    fit: BoxFit.scaleDown,
                    height: 52,
                    width: 52,
                    color: themeData.colorScheme.background,
                  ),
                )),
            title: transaction.title,
            subtitle: transaction.date,
            trailing: Text.rich(TextSpan(children: [
              TextSpan(
                text: transaction.amount[0],
                style: TextStyle(
                  color: transaction.isDebit
                      ? themeData.colorScheme.error
                      : themeData.colorScheme.onTertiary,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text:
                    transaction.amount.substring(1), // rest of the amount text
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: themeData.colorScheme.background,
                  fontSize: 18,
                ),
              ),
            ])),
          );
        },
        separatorBuilder: (context, index) => 10.y,
        itemCount: transactions.length);
  }
}
