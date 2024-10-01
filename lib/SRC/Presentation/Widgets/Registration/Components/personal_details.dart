import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/drop_down_tile.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
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
            'Personal Details',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.5,
          centerTitle: '5/9',
        ).padHorizontal(30),
        40.y,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'email address',
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'serial number',
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.datetime,
              hintText: 'Release date',
            ),
            20.y,
            CommonDropDown(
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: theme.colorScheme.onBackground,
              ),
              hintText: 'Education',
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
            CommonChipListWidget(
              dataList: const ['Female', 'Male'],
              onSelect: (v) {},
              title: 'Gender',
            ),
          ],
        ).padHorizontal(24),
      ],
    );
  }

  List<String> _searchInList(List<String> dummyStringList, String str) {
    return dummyStringList
        .where((element) => element.toLowerCase().contains(str.toLowerCase()))
        .toList();
  }
}
