import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class BeneficaryInputField extends StatelessWidget {
  const BeneficaryInputField({
    super.key,
    required this.title,
    this.controller,
    this.readOnly,
  });
  final String title;
  final TextEditingController? controller;

  final bool? readOnly;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        AppText(
          title,
          style: theme.textTheme.bodySmall!.copyWith(
            color: theme.colorScheme.tertiary,
            fontSize: 12,
          ),
        ),
        20.x,
        Expanded(
            child: AppTextField(
          controller: controller ?? TextEditingController(),
          textInputType: TextInputType.text,
          filledColor: theme.colorScheme.onSecondary,
          readOnly: readOnly ?? false,
          constraints: BoxConstraints(
            maxHeight: 40.h,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0,
          ),
          titleStyle: theme.textTheme.bodySmall!.copyWith(
            fontSize: 10,
          ),
        ))
      ],
    );
  }
}
