import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class SwitchContainer extends StatefulWidget {
  String title;
  bool isSwitched = false;
  String subTitle;
  Function(bool)? onChanged;
  SwitchContainer({
    required this.subTitle,
    required this.title,
    this.onChanged,
    required this.isSwitched,
    super.key,
  });

  @override
  State<SwitchContainer> createState() => _SwitchContainerState();
}

class _SwitchContainerState extends State<SwitchContainer> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.fS, vertical: 20.fS),
      decoration: BoxDecoration(
        border: Border.all(color: themeData.colorScheme.tertiary),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: themeData.textTheme.bodyLarge!.copyWith(
                    color: themeData.colorScheme.background, fontSize: 15),
              ).padHorizontal(10),
              Switch(
                  value: widget.isSwitched,
                  onChanged: widget.onChanged,
                  activeColor: themeData.colorScheme.onTertiary),
            ],
          ),
          Text(
            widget.subTitle,
            style: themeData.textTheme.displaySmall!
                .copyWith(color: themeData.colorScheme.tertiary),
          ).padHorizontal(10),
        ],
      ),
    );
  }
}
