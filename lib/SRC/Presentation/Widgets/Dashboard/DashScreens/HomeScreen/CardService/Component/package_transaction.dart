import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class PackageTransactionTab extends StatefulWidget {
  const PackageTransactionTab({
    super.key,
  });

  @override
  State<PackageTransactionTab> createState() => _PackageTransactionTabState();
}

class _PackageTransactionTabState extends State<PackageTransactionTab> {
  final TextEditingController _startDateController = TextEditingController();

  final TextEditingController _endDateController = TextEditingController();

  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.y,
        SwitchContainer(
            isSwitched: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            subTitle: 'Are you looking in a specific date?',
            title: 'Zafar'),
        19.y,
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _startDateController,
                textInputType: TextInputType.datetime,
                hintText: 'Start Date',
                suffixIcon: AssetImageWidget(
                  url: Assets.icons.calenderIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: AppTextField(
                controller: _endDateController,
                textInputType: TextInputType.datetime,
                hintText: 'End Date',
                suffixIcon: AssetImageWidget(
                  url: Assets.icons.calenderIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ],
    ).padHorizontal(29.rSA);
  }
}
