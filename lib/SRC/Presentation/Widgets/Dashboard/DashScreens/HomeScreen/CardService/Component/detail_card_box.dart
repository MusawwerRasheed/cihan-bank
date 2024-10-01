import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class DetailCardBox extends StatelessWidget {
  String title;
  String accountType;
  String value;
  Color color;

  DetailCardBox({
    super.key,
    required this.title,
    required this.accountType,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Chip(
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(
            title,
            style: theme.textTheme.bodyLarge!
                .copyWith(color: theme.colorScheme.onBackground),
          ),
          8.y,
          const Divider(),
          20.y,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AppText(accountType,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.tertiary,
                )),
            AppText(value,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: color,
                ))
          ]),
          10.y,
        ],
      ).padHorizontal(24),
    );
  }
}
