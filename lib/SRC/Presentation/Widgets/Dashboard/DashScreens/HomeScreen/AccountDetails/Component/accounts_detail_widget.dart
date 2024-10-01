import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AccountDetailWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const AccountDetailWidget({
    super.key,
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.rSA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title,
            style: themeData.textTheme.bodyLarge!.copyWith(
                color: themeData.colorScheme.background, fontSize: 15),
          ),
          AppText(
            value,
            style: themeData.textTheme.bodySmall!
                .copyWith(color: color ?? themeData.colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}
