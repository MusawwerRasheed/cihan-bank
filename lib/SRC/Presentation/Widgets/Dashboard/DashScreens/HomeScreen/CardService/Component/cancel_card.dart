import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/drop_down_tile.dart';

class CancelCard extends StatelessWidget {
  const CancelCard({super.key});
  List<String> _searchInList(List<String> dummyStringList, String str) {
    return dummyStringList
        .where((element) => element.toLowerCase().contains(str.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final dummyStringList = List.generate(10, (index) => "Option $index");

    return CommonDropDown(
      suffixIcon: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: theme.colorScheme.onBackground,
      ),
      hintText: 'LOST CARD',
      suggestionsCallback: (str) {
        return _searchInList(dummyStringList, str);
      },
      itemBuilder: (context, v) {
        return DropDownSearchTile(val: v);
      },
      onSuggestionSelected: (v) {},
      controller: TextEditingController(),
    ).padHorizontal(21.rSA);
  }
}
