import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(
            horizontalPad: 24,
          ),
          Expanded(
              child: ListView(
            children: [
              AssetImageWidget(
                url: Assets.images.logoImg.path,
                height: 163,
                width: 163,
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
              const PinCodeWidget().padHorizontal(30),
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
          ))
        ],
      ),
      bottomNavigationBar: CommonButton(
        onTap: () {
          CommonDialogs.showSuccessDialogue(
            barrierDismissible: false,
              context: context, title: 'successful request');

          Future.delayed(const Duration(milliseconds: 1500)).then((vaa){

            AppContext.navigatorKey.currentContext?.pushAndRemoveUntil(const AppFrame(),(_)=>false);

          });

        },
        verticalMargin: 16,
        horizontalMargin: 24,
        text: 'Next',
      ),
    );
  }
}
