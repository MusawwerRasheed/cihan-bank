import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/bottom_sheet.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final RegistrationController registrationController =
      RegistrationController();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: registrationController.screenIndex,
      builder: (ctx, index, child) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: AssetImageWidget(
                  url: Assets.images.fullTemplate.path,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 1.stB + 18),
                  const TopBar(
                    horizontalPad: 24,
                  ),
                  Expanded(child: registrationController.screens[index]),
                ],
              ),
            ],
          ),
          bottomNavigationBar: index == 2
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    10.y,
                    CommonButton(
                      onTap: () {
                        registrationController.incrementIndex();
                      },
                      verticalMargin: 0,
                      text: 'Agree',
                      horizontalMargin: 24,
                    ),
                    8.y,
                    CommonButton(
                      backgroundColor:
                          Theme.of(context).colorScheme.onBackground,
                      onTap: () {
                        registrationController.incrementIndex();
                      },
                      verticalMargin: 0,
                      text: 'Cancel',
                      horizontalMargin: 24,
                    ),
                    16.y,
                  ],
                )
              : index == 1
                  ? CommonButton(
                      onTap: () {

                        CustomBottomSheet().showBottomSheet(context,SizedBox(

                            height: 1.sh/1.4,
                            child: Column(
                              children: [
                                20.y,
                                Container(color: Colors.grey.withOpacity(0.5), height: 3,width: 50.w,),
                                30.y,
                                Expanded(child: TermsAndConditions(registrationController: registrationController)

                                ),
                              ],
                            )) );
                       // registrationController.incrementIndex();
                      },
                      verticalMargin: 16,
                      text: 'Verify',
                      horizontalMargin: 24,
                    )
                  : CommonButton(
                      onTap: () {
                        registrationController.incrementIndex();
                      },
                      verticalMargin: 16,
                      text: 'Next',
                      horizontalMargin: 24,
                    ),
        );
      },
    );
  }
}
