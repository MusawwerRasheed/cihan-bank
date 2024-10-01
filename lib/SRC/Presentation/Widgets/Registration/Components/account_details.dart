import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/drop_down_tile.dart';

class AccountDetailss extends StatefulWidget {
  const AccountDetailss({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<AccountDetailss> createState() => _AccountDetailssState();
}

class _AccountDetailssState extends State<AccountDetailss> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dummyStringList = List.generate(10, (index) => "Option $index");

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            DynamicAppIconHandler.buildIcon(context: context,svg: Assets.icons.profileIcon),
            4.x,
            Center(
              child: AppText(
                'Checking Point',
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        4.y,
        Center(
          child: AppText(
            'Account Details',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.8,
          centerTitle: '8/9',
        ).padHorizontal(30),
        40.y,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonDropDown(
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: theme.colorScheme.onBackground,
              ),
              hintText: 'Account type',
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
            CommonDropDown(
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: theme.colorScheme.onBackground,
              ),
              hintText: 'Branch',
              suggestionsCallback: (str) {
                return _searchInList(dummyStringList, str);
              },
              itemBuilder: (context, v) {
                return DropDownSearchTile(val: v);
              },
              onSuggestionSelected: (v) {},
              controller: TextEditingController(),
            ),
            40.y,
            CommonChipListWidget(
                dataList: ['US Dollar', 'IQD'],
                onSelect: (v) {},
                title: 'Account currency'),
            40.y,
            CommonChipListWidget(
                dataList: ['Location Details', 'else'],
                onSelect: (v) {},
                title: 'Hand over the ATM card to?')
          ],
        ).padHorizontal(24)
      ],
    );
  }

  List<String> _searchInList(List<String> dummyStringList, String str) {
    return dummyStringList
        .where((element) => element.toLowerCase().contains(str.toLowerCase()))
        .toList();
  }
}
