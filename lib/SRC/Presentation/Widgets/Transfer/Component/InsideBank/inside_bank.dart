import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transfer/Component/InnerTransaction/confirmationinnertrans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsideBankTransaction extends StatefulWidget {
  const InsideBankTransaction({super.key});

  @override
  State<InsideBankTransaction> createState() => _InsideBankTransactionState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _InsideBankTransactionState extends State<InsideBankTransaction> {
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

  List<RowModel> lsDto = [
    RowModel(path: Assets.images.user1Img.path, name: 'Name'),
    RowModel(path: Assets.images.user2Img.path, name: 'Name'),
    RowModel(path: Assets.images.user3Img.path, name: 'Name'),
    RowModel(path: Assets.images.user4Img.path, name: 'Name'),
    RowModel(path: Assets.images.user3Img.path, name: 'Name'),
    RowModel(path: Assets.images.user4Img.path, name: 'Name'),
    RowModel(path: Assets.images.user3Img.path, name: 'Name'),
    RowModel(path: Assets.images.user4Img.path, name: 'Name'),
  ];

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "In The Bank Transaction",
                        style: themeData.textTheme.headlineSmall,
                      ),
                      AppText(
                        'Fill the of the following',
                        style: themeData.textTheme.bodySmall
                            ?.copyWith(fontSize: 18.fS),
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
              15.y,

              AppText(
                'To the beneficiary:',
                style: themeData.textTheme.bodySmall,
              ).withMargin(EdgeInsets.only(left: 10.rSA)),
              //10.y,
              // AppText('Trading Currency',style: themeData.textTheme.bodyLarge
              //
              // ),
              10.y,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: lsDto
                      .mapIndexed((i, e) => RowWidget(
                            name: e.name,
                            path: e.path,
                          ).withMargin(
                              EdgeInsets.only(left: i == 0 ? 0 : 10.rSA)))
                      .toList(),
                ),
              ),
              10.y,

              CommonDropDown(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: themeData.colorScheme.tertiaryContainer,
                ),
                hintText: "Choose different",
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
              CommonChipListWidget(
                activeIndex: 1,
                dataList: const ['US dollar', 'IQD'],
                onSelect: (s) {},
                title: 'Trading Currency',
                titleStyle: themeData.textTheme.bodySmall,
              ),
              20.y,

              AppText(
                "Amount",
                style: themeData.textTheme.headlineSmall,
              ),
              AppText(
                'You can select amount or type ',
                style: themeData.textTheme.bodySmall?.copyWith(fontSize: 15.fS),
              ),
              5.y,
              AppTextField(
                controller: TextEditingController(),
                textInputType: TextInputType.text,
                hintText: '0.00 IQD',
              ),
              10.y,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['50 ID', '100 ID', '150 ID', '200 ID', '250 ID']
                      .mapIndexed((index, element) => Chip(
                            label: AppText(element),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelStyle: themeData.textTheme.labelMedium
                                ?.copyWith(
                                    color: index == 2 ? Colors.white : null),
                            backgroundColor: index == 2
                                ? themeData.colorScheme.primary
                                : null,
                          ).withMargin(
                              EdgeInsets.only(left: index != 0 ? 10 : 0)))
                      .toList(),
                ),
              ),
              10.y,
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
                hintText: "Choose different",
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
              10.y,
            ],
          ).padHorizontal(24),
          Positioned(
              bottom: 0,
              left: 24,
              right: 24,
              child: CommonButton(
                text: 'Transfer',
                onTap: () {
                  context.to(const InnerTransactionConfirmation(
                    innerBank: true,
                  ));
                },
              ))
        ],
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, this.name, this.path});
  final String? name;
  final String? path;
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      children: [
        AssetImageWidget(url: path ?? ""),
        AppText(
          name ?? "",
          style: themeData.textTheme.labelMedium
              ?.copyWith(fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}

class RowModel {
  RowModel({this.name, this.path});

  final String? path;
  final String? name;
}
