import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CommonDropDown extends StatelessWidget {
  const CommonDropDown({
    super.key,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSuggestionSelected,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  final List<String> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, String) itemBuilder;
  final void Function(String) onSuggestionSelected;
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropDownSearchFormField(
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        elevation: 2,
        closeSuggestionBoxWhenTapOutside: false,
      ),
      textFieldConfiguration: TextFieldConfiguration(
        style: theme.textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText ?? '',
          hintStyle: theme.textTheme.bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onPrimaryFixed),
        ),
        controller: controller,
      ),
      suggestionsCallback: suggestionsCallback,
      validator: validator,
      itemBuilder: itemBuilder,
      onSuggestionSelected: onSuggestionSelected,
      displayAllSuggestionWhenTap: true,
    );
  }
}
