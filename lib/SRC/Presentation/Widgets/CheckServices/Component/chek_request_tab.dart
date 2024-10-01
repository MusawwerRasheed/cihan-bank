import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CheckRequestTab extends StatelessWidget {
  CheckRequestTab({
    super.key,
  });

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
    return Column(
      children: [
        CommonDropDown(
          suffixIcon: DynamicAppIconHandler.buildIcon(
              context: context,
              svg: Assets.icons.dropdownIcon,
              fit: BoxFit.scaleDown),
          hintText: "Delivery mode",
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
        8.y,
        CommonDropDown(
          suffixIcon: DynamicAppIconHandler.buildIcon(
              context: context,
              svg: Assets.icons.dropdownIcon,
              fit: BoxFit.scaleDown),
          hintText: "Page number",
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
    );
  }
}
