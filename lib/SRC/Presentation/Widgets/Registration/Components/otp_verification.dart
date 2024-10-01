import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/image_widgets.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/pin_code.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Controller/registration_controller.dart';
import 'package:cihan_bank_mobile_banking/gen/assets.gen.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        AssetImageWidget(
          url: Assets.images.logoImg.path,
          height: 163,
          width: 163,
          fit: BoxFit.contain,
        ),
        40.y,
        Center(
          child: AppText(
            "Verification OTP",
            style: theme.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        30.y,
        PinCodeWidget().padHorizontal(30),
        22.y,
        Center(
          child: AppText(
            maxLine: 3,
            "A code has been sent to your\nphone number",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 16,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        80.y,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppText(
              maxLine: 1,
              "Resend in",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            8.x,
            AppText(
              maxLine: 1,
              "00:30",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 24,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
