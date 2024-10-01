import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class WelcomeRegistrationScreen extends StatefulWidget {
  const WelcomeRegistrationScreen({super.key});

  @override
  State<WelcomeRegistrationScreen> createState() =>
      _WelcomeRegistrationScreenState();
}

class _WelcomeRegistrationScreenState extends State<WelcomeRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(),
          AssetImageWidget(
              url: Assets.images.logoImg.path, height: 163, width: 163),
          40.y,
          AppText(
            "Welcome!",
            style: theme.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          10.y,
          AppText(
            "Welcome to Cihan On-boarding ",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.secondary,
            ),
          ),
          30.y,
          AppText(
            maxLine: 10,
            "You can now create a profile and open account through five easy steps!\n\nMake sure you have your National ID or Passport and proof of residence with you to complete the on-boarding process.\n\nFor more information please visit our website:",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.secondary,
            ),
          ),
          4.y,
          Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              "Website link",
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline,
                decorationColor: theme.colorScheme.primary,
                fontSize: 13,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const Spacer(),
          CommonButton(
            onTap: () {
              context.to(RegistrationScreen());
            },
            text: 'Start',
            verticalMargin: 0,
          ),
          30.y,
        ],
      ).padHorizontal(24),
    );
  }
}
