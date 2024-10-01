import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/drop_down_tile.dart';

class AllTransactionScreen extends StatelessWidget {
  const AllTransactionScreen({super.key});
  List<String> _searchInList(List<String> dummyStringList, String str) {
    return dummyStringList
        .where((element) => element.toLowerCase().contains(str.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final dummyStringList = List.generate(10, (index) => "Option $index");

    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        30.y,
        CommonDropDown(
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: theme.colorScheme.onBackground,
          ),
          hintText: 'Amount type',
          suggestionsCallback: (str) {
            return _searchInList(dummyStringList, str);
          },
          itemBuilder: (context, v) {
            return DropDownSearchTile(val: v);
          },
          onSuggestionSelected: (v) {},
          controller: TextEditingController(),
        ),
        13.y,
        CommonDropDown(
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: theme.colorScheme.onBackground,
          ),
          hintText: 'Transition amount ',
          suggestionsCallback: (str) {
            return _searchInList(dummyStringList, str);
          },
          itemBuilder: (context, v) {
            return DropDownSearchTile(val: v);
          },
          onSuggestionSelected: (v) {},
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
