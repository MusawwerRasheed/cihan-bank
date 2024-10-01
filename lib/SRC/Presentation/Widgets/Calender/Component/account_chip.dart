import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/pending_order_model.dart';

class AccountChip extends StatelessWidget {
  final PendingOrder accountDetail;

  AccountChip({required this.accountDetail});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountDetailWidget(
            title: 'Ref number',
            value: accountDetail.refNumber,
          ),
          AccountDetailWidget(
            title: 'Implementation',
            value: accountDetail.implementation,
          ),
          AccountDetailWidget(
            title: 'Amount',
            value: accountDetail.amount.toString(),
          ),
          AccountDetailWidget(
              title: 'Date', value: accountDetail.date.toString()),
          Divider(),
          CommonButton(
            height: 34.0,
            onTap: () {},
            verticalPadding: 0,
            leadingSvg:
                Assets.icons.loadCircleIcon, // Update with your SVG path
            text: "Download",
            textSize: 11,
          )
        ],
      ),
    );
  }
}
