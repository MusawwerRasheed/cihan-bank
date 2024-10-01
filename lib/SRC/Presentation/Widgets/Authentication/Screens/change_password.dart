import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repeatPasswordController = TextEditingController();
    bool rememberMe = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.images.fullTemplate.path))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 1.stB + 18),
                TopBar(),
                Center(
                  child: AssetImageWidget(
                    url: Assets.images.logoImg.path,
                    width: 0.5.sw,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                39.y,
                Text(
                  "Change Password",
                  style: themeData.textTheme.headlineMedium,
                ),
                34.y,
                AppTextField(
                    textInputType: TextInputType.text,
                    controller: currentPasswordController,
                    isState: true,
                    hintText: "Current password"),
                20.y,
                const Divider(),
                36.y,
                AppTextField(
                    textInputType: TextInputType.text,
                    obscureText: true,
                    isState: true,
                    controller: passwordController,
                    hintText: "New password"),
                12.y,
                AppTextField(
                    textInputType: TextInputType.text,
                    controller: repeatPasswordController,
                    isState: true,
                    hintText: "Repeat password "),
                12.y,
                RememberMeWidget(
                  text: 'Remember me',
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CommonButton(
        onTap: () {
          context.to(const PhoneSignInScreen());
        },
        text: "Create Account",
        verticalMargin: 16,
        horizontalMargin: 24,
      ),
    );
  }
}
