import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/drop_down_tile.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Vouchers/pay_voucher.dart';

class VoucherListScreen extends StatefulWidget {
  const VoucherListScreen({super.key});

  @override
  State<VoucherListScreen> createState() => _VoucherListScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _VoucherListScreenState extends State<VoucherListScreen> {
  final dummyStringList = List.generate(10, (index) => "Option $index");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(scaffoldKey: _scaffoldKey),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            TopBar(
              actionIcon: Assets.icons.sortIcon,
              scaffoldKey: _scaffoldKey,
            ),
            18.y,
            AppText(
              'XBOX ( voucher )',
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 22,
              ),
            ),
            AppText(
              'Select your location',
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 12,
              ),
            ),
            30.y,
            Expanded(
              child: ListView(
                children: [
                  CommonDropDown(
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: theme.colorScheme.onBackground,
                    ),
                    hintText: 'Location',
                    suggestionsCallback: (str) {
                      return _searchInList(dummyStringList, str);
                    },
                    itemBuilder: (context, v) {
                      return DropDownSearchTile(val: v);
                    },
                    onSuggestionSelected: (v) {},
                    controller: TextEditingController(),
                  ),
                  20.y,
                  AssetImageWidget(url: Assets.images.itunes.path),
                  30.y,
                  CommonDropDown(
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: theme.colorScheme.onBackground,
                    ),
                    hintText: 'Category',
                    suggestionsCallback: (str) {
                      return _searchInList(dummyStringList, str);
                    },
                    itemBuilder: (context, v) {
                      return DropDownSearchTile(val: v);
                    },
                    onSuggestionSelected: (v) {},
                    controller: TextEditingController(),
                  ),
                  20.y,
                  Container(
                    height: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: LightColorsPalate.successColor),
                      color: LightColorsPalate.lightGreenColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                '25% discount voutcher',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              AppText(
                                'Voucher Price:',
                                style: theme.textTheme.bodySmall!.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppText(
                          '97\$',
                          style: theme.textTheme.titleSmall!.copyWith(
                              color: LightColorsPalate.successColor,
                              fontSize: 14),
                        ),
                      ],
                    ).padHorizontal(26),
                  ),
                  200.y,
                ],
              ),
            )
          ],
        ).padHorizontal(24),
        bottomNavigationBar: CommonButton(
          onTap: () {
            context.to(PayVoucherScreen());
          },
          text: 'Pay',
          verticalMargin: 16,
          horizontalMargin: 24,
        ),
      ),
    );
  }

  List<String> _searchInList(List<String> dummyStringList, String str) {
    return dummyStringList
        .where((element) => element.toLowerCase().contains(str.toLowerCase()))
        .toList();
  }
}
