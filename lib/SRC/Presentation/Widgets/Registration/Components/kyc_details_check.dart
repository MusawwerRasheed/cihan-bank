import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Colors/lightcolorpallete.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/custom_percent_indicator.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Controller/registration_controller.dart';

class KycDetailsCheck extends StatefulWidget {
  const KycDetailsCheck({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<KycDetailsCheck> createState() => _KycDetailsCheckState();
}

class _KycDetailsCheckState extends State<KycDetailsCheck> {
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
            'KYC Details',
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
        Column(
          children: [
            AppTextField(
              hintText: 'Name in arabic',
              controller: TextEditingController(),
              textInputType: TextInputType.text,
            ),
            20.y,
            AppTextField(
              hintText: 'Name in english',
              controller: TextEditingController(),
              textInputType: TextInputType.text,
            ),
            20.y,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: LightColorsPalate.lightGreenColor,
              ),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    AssetImageWidget(
                      url: Assets.images.aeImg.path,
                      height: 160,
                    ),
                    10.y,
                    AppText(
                      'Mohammed Ali',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 24,
                      ),
                    ),
                    20.y,
                    const CheckTile(title: 'Photo Quality Check'),
                    const CheckTile(title: 'Authenticity Check'),
                    const CheckTile(title: 'Data Capturing Check'),
                  ],
                ),
              ),
            ),
            20.y,
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.onBackground.withOpacity(.6),
                ),
                10.x,
                AppText(
                  'Latest delivery information',
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.onBackground,
                    fontSize: 17,
                  ),
                )
              ],
            ),
            20.y,
            const DeliveryInformationTile(
                label: "ID number", value: "198136281960"),
            const DeliveryInformationTile(
                label: "ID Release Loccation ", value: "Iraq/ Bagdad"),
            const DeliveryInformationTile(
                label: "Birth location", value: "Iraq/ Bagdad"),
            const DeliveryInformationTile(
                label: "Release Date", value: "00 - jun 0000"),
            const DeliveryInformationTile(label: "Gender", value: "Male"),
            const DeliveryInformationTile(
                label: "Birth date", value: "00 - AGU - 0000"),
            const DeliveryInformationTile(label: "Gender", value: "Male"),
            const DeliveryInformationTile(
                label: "Family number ", value: "835698265"),
            const DeliveryInformationTile(label: "Mother Name", value: "Lames"),
            18.y,
          ],
        ).padHorizontal(24)
      ],
    );
  }
}

class DeliveryInformationTile extends StatelessWidget {
  const DeliveryInformationTile({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: theme.colorScheme.surface,
        border: Border.all(
          color: theme.colorScheme.tertiary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            label,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onBackground,
              fontSize: 14,
            ),
          ),
          AppText(
            value,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.tertiary,
              fontSize: 11,
            ),
          )
        ],
      ).pad(const EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
    ).padVertical(4);
  }
}

class CheckTile extends StatelessWidget {
  const CheckTile({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        const Icon(Icons.check_circle,
            color: LightColorsPalate.successColor, size: 18),
        12.x,
        AppText(
          title,
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 14,
            color: LightColorsPalate.successColor,
          ),
        )
      ],
    ).padVertical(8);
  }
}
