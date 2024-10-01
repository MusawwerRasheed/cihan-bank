import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/apptext_field.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/custom_percent_indicator.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Controller/registration_controller.dart';

class KycDetail extends StatefulWidget {
  const KycDetail({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<KycDetail> createState() => _KycDetailState();
}

class _KycDetailState extends State<KycDetail> {
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
          child: AppText(
            'KYC Details ',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.4,
          centerTitle: '4/9',
        ).padHorizontal(30),
        40.y,
        AppTextField(
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          hintText: 'Family number',
          controller: TextEditingController(),
          textInputType: TextInputType.text,
        ).padHorizontal(24)
      ],
    );
  }
}
