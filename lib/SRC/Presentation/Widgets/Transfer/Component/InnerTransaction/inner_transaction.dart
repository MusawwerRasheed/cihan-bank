import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transfer/Component/InnerTransaction/confirmationinnertrans.dart';

class InnerTransaction extends StatefulWidget {
  const InnerTransaction({super.key});

  @override
  State<InnerTransaction> createState() => _InnerTransactionState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _InnerTransactionState extends State<InnerTransaction> {
  final List<String> _suggestions = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
  ];

  List<String> _suggestionsCallback(String query) {
    return _suggestions
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 90.h),
            physics: const BouncingScrollPhysics(),
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.stB + 18.h),
              TopBar(
                actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,
              ),
              30.y,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      AppText(
                        "Inner Transaction",
                        style: themeData.textTheme.headlineMedium,
                      ),
                      AppText(
                        'Fill the of the following',
                        style: themeData.textTheme.bodySmall
                            ?.copyWith(fontSize: 20.fS),
                      ),
                    ],
                  ),
                  const Spacer(),
                  DynamicAppIconHandler.buildIcon(
                      context: context, svg: Assets.icons.bookmarkFillIcon)
                ],
              ),
              20.y,

              CommonDropDown(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: themeData.colorScheme.tertiaryContainer,
                ),
                hintText: "From an account",
                suggestionsCallback: _suggestionsCallback,
                itemBuilder: (BuildContext context, String suggestion) {
                  return ListTile(
                    title: Text(
                      suggestion,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  );
                },
                onSuggestionSelected: (String suggestion) {
                  // privateController.text = suggestion;
                },
                controller: TextEditingController(),
              ),
              10.y,
              CommonDropDown(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: themeData.colorScheme.tertiaryContainer,
                ),
                hintText: "Calculation",
                suggestionsCallback: _suggestionsCallback,
                itemBuilder: (BuildContext context, String suggestion) {
                  return ListTile(
                    title: Text(
                      suggestion,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  );
                },
                onSuggestionSelected: (String suggestion) {
                  // privateController.text = suggestion;
                },
                controller: TextEditingController(),
              ),
              //10.y,
              // AppText('Trading Currency',style: themeData.textTheme.bodyLarge
              //
              // ),
              10.y,
              CommonChipListWidget(
                activeIndex: 1,
                dataList: const ['US dollar', 'IQD'],
                onSelect: (s) {},
                title: 'Trading Currency',
                titleStyle: themeData.textTheme.bodySmall,
              ),
              20.y,
              AppTextField(
                controller: TextEditingController(),
                textInputType: TextInputType.text,
                hintText: 'Matches',
              ),
              10.y,
              AppTextField(
                controller: TextEditingController(),
                suffixHeight: 10,
                suffixWidth: 10,
                suffixIcon: SvgPicture.asset(
                  Assets.icons.dateTodayIcon,
                  height: 10,
                  width: 10,
                  fit: BoxFit.scaleDown,
                ),
                textInputType: TextInputType.text,
                hintText: 'Transfer Date',
              ),
              20.y,
              AppText(
                'The purpose of the transfer',
                style: themeData.textTheme.bodySmall,
              ),
              10.y,
              CommonDropDown(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: themeData.colorScheme.tertiaryContainer,
                ),
                hintText: "copy the invoice",
                suggestionsCallback: _suggestionsCallback,
                itemBuilder: (BuildContext context, String suggestion) {
                  return ListTile(
                    title: Text(
                      suggestion,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  );
                },
                onSuggestionSelected: (String suggestion) {
                  // privateController.text = suggestion;
                },
                controller: TextEditingController(),
              ),
              10.y,
              AppText(
                'Repeat ',
                style: themeData.textTheme.bodySmall,
              ),
              10.y,
              CommonDropDown(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: themeData.colorScheme.tertiaryContainer,
                ),
                hintText: "None",
                suggestionsCallback: _suggestionsCallback,
                itemBuilder: (BuildContext context, String suggestion) {
                  return ListTile(
                    title: Text(
                      suggestion,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  );
                },
                onSuggestionSelected: (String suggestion) {
                  // privateController.text = suggestion;
                },
                controller: TextEditingController(),
              ),
            ],
          ).padHorizontal(24),
          Positioned(
              bottom: 0,
              left: 24,
              right: 24,
              child: CommonButton(
                text: 'Transfer',
                onTap: () {
                  context.to(InnerTransactionConfirmation());
                },
              ))
        ],
      ),
    );
  }
}
