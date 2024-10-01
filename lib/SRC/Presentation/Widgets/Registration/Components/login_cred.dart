import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class LoginCredentials extends StatefulWidget {
  const LoginCredentials({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<LoginCredentials> createState() => _LoginCredentialsState();
}

class _LoginCredentialsState extends State<LoginCredentials> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final dummyStringList = List.generate(10, (index) => "Option $index");

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            DynamicAppIconHandler.buildIcon(context: context,svg: Assets.icons.loginCrdentialIcon),
            4.x,
            Center(
              child: AppText(
                'Login Credentials',
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        4.y,
        Center(
          child: AppText(
            'Login Credentials',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        20.y,
        const CustomPercentIndicator(
          val: .97,
          centerTitle: '9',
        ).padHorizontal(30),
        40.y,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'Username',
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'Password',
              isState: true,
            ),
            20.y,
            const Divider(thickness: 0.5),
            20.y,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: LightColorsPalate.warningTextColor.withOpacity(0.2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  DynamicAppIconHandler.buildIcon(
                      context: context, svg: Assets.icons.warningIcon),
                  10.x,
                  AppText(
                    'make sure the password matches',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: LightColorsPalate.warningTextColor),
                  )
                ],
              ),
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'Confirm Password',
              isState: true,
            ),
            20.y,
          ],
        ).padHorizontal(24)
      ],
    );
  }

  // List<String> _searchInList(List<String> dummyStringList, String str) {
  //   return dummyStringList
  //       .where((element) => element.toLowerCase().contains(str.toLowerCase()))
  //       .toList();
  // }
}
