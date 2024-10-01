import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/validator.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Styles/app_textstyles.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/bottom_sheet.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Authentication/Screens/terms_and_condition_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Authentication/component/allow_sheet_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  ValueNotifier<int> attemptNotifier=ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(Assets.images.fullTemplate.path))),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 1.stB + 18),
                  Align(
                    alignment: Alignment.topRight,
                    child: AssetImageWidget(
                      url: Assets.icons.globe,
                    ),
                  ),
                  21.y,
                  Center(
                    child: AssetImageWidget(
                      url: Assets.images.logoImg.path,
                      width: 0.4.sw,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  39.y,
                  AppText(
                    "Log-In with",
                    style: themeData.textTheme.headlineMedium,
                  ),
                  18.y,
                  AppTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: Validate.email,
                      hintText: "Enter your email address"),
                  13.y,
                  AppTextField(
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                      isState: true,
                      validator: Validate.password,
                      controller: passwordController,
                      hintText: "Password"),
                  7.y,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RememberMeWidget(
                        text: 'Remember me',
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      AppText(onTap: () {
                        context.to(const ChangePasswordScreen());
                      }, 'Forgot Password?',
                          style: themeData.textTheme.bodySmall!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  themeData.colorScheme.primaryContainer,
                              color: themeData.colorScheme.primaryContainer))
                    ],
                  ),
                  91.y,
                  AppText(
                    onTap: () => context.to(const TermsAndConditionScreen()),
                    'Terms And Conditions',
                    style: themeData.textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: themeData.colorScheme.primary,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                  70.y,
                ],
              ).padHorizontal(26.fS),
            ),
          )),
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              builder: (context,attemptVal,dd) {
                return CommonButton(
                    onTap: () {

                      print(_formKey.currentState!.validate());

                      if(_formKey.currentState!.validate())
                        {
                          CustomBottomSheet().showBottomSheet(context,


                              const AllowSheetWidget()


                          );
                        }
                      else
                        {
                          attemptNotifier.value= attemptVal+1;
                          attemptNotifier.notifyListeners();
                        attemptVal<3?  CommonDialogs.showFailureDialogue(context: context, title: 'Wrong login, please try again.\n You have attempts ${attemptVal+1}/3 trials',



                          ):
                        CommonDialogs.showFailureDialogue(context: context, title: 'You have reach the maximum\n number of failed login attempts',
                          actions: [
                            
                            CommonButton(onTap: (){} , backgroundColor: Colors.black,text: 'Call Support Now',

                              textFontWeight: FontWeight.normal,
                              textSize: 18.fS,
                              leadingIconMargins:EdgeInsets.only(right: 10.rSA) ,
                              leadingIconWidth: 20,
                              leadingIconHeight: 20,
                              leadingIcon: Icons.call_outlined,leadingColor: Colors.white, )
                            
                          ]



                        );

                        }

                    //  context.to(const AppFrame());
                    },
                    horizontalMargin: 26.rSA,
                    text: "Log-In");
              }, valueListenable: attemptNotifier,
            ),
            CommonButton(
                onTap: () {
                  context.to(const WelcomeRegistrationScreen());
                },
                text: "Create Profile",
                horizontalMargin: 26.rSA,
                backgroundColor: themeData.colorScheme.onPrimaryFixed),
          ],
        ),
      ),
    );
  }


}



