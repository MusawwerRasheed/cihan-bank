import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/apptext_field.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/custom_percent_indicator.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Controller/registration_controller.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';

class PhoneNumberValidation extends StatefulWidget {
  const PhoneNumberValidation(
      {super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<PhoneNumberValidation> createState() => _PhoneNumberValidationState();
}

class _PhoneNumberValidationState extends State<PhoneNumberValidation> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        Center(
          child: AppText(
            'Checking Point',
            style: theme.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        4.y,
        Center(
          child: AppText('verification details',
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: theme.colorScheme.tertiary,
              )),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.1,
          centerTitle: '1/9',
        ).padHorizontal(30),
        40.y,
        AppTextField(
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                widget.registrationController.countryCode,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ).onTapped(onTap: () {
                showCountryPicker(
                    showPhoneCode: true,
                    context: context,
                    onSelect: (v) {
                      widget.registrationController.countryCode =
                          "+${v.phoneCode}";

                      setState(() {});
                    });
              })
            ],
          ).pad(const EdgeInsets.only(left: 14)),
          controller: TextEditingController(),
          enabled: true,
          textInputType: TextInputType.number,
        ).padHorizontal(24),
        19.y,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: LightColorsPalate.errorColor.withOpacity(0.2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              DynamicAppIconHandler.buildIcon(
                  context: context,
                  svg: Assets.icons.warningIcon,
                  iconColor: LightColorsPalate.errorColor),
              10.x,
              AppText(
                'minimum = 11, maximum = 15',
                style: theme.textTheme.bodySmall!
                    .copyWith(color: LightColorsPalate.errorColor),
              )
            ],
          ),
        ).padHorizontal(24),
      ],
    );
  }
}
