import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AccountBalanceTab extends StatelessWidget {
  AccountBalanceTab({
    super.key,
  });
  final TextEditingController _startDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AppTextField(
        controller: _startDateController,
        textInputType: TextInputType.datetime,
        hintText: 'Start Date',
        suffixIcon: AssetImageWidget(
          url: Assets.icons.calenderIcon,
          fit: BoxFit.scaleDown,
        ),
      ),
    ).padHorizontal(29.rSA);
  }
}
