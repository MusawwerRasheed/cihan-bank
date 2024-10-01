import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/drop_down_tile.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
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

            DynamicAppIconHandler.buildIcon(context: context,svg: Assets.icons.occupationIcon),
            4.x,
            Center(
              child: AppText(
                'Occupation Details',
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        4.y,
        Center(
          child: AppText(
            'Job Details',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.6,
          centerTitle: '6/9',
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
              hintText: 'Job',
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
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.number,
              hintText: 'Salary',
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'Work location',
            ),
            20.y,
            CommonDropDown(
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: theme.colorScheme.onBackground,
              ),
              hintText: 'City',
              suggestionsCallback: (str) {
                return _searchInList(dummyStringList, str);
              },
              itemBuilder: (context, v) {
                return DropDownSearchTile(val: v);
              },
              onSuggestionSelected: (v) {},
              controller: TextEditingController(),
            ),
            60.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.datetime,
              hintText: 'Job serial number',
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.datetime,
              hintText: 'Last date',
              suffixIcon: DynamicAppIconHandler.buildIcon(
                fit: BoxFit.scaleDown,
                context: context,
                svg: Assets.icons.calenderIcon,
              ),
            ),
            20.y,
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
