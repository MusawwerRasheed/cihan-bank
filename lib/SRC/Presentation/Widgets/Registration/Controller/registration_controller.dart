import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/account_details.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/login_cred.dart';

class RegistrationController {
  ValueNotifier<int> screenIndex = ValueNotifier(0);

  incrementIndex() {
    if (screenIndex.value < screens.length - 1) {
      screenIndex.value++;
    } else {
      CommonDialogs.showSuccessDialogue(
        barrierDismissible: false,
          context: AppContext.navigatorKey.currentContext!,
          title: "Successful Request");
      Future.delayed(const Duration(milliseconds: 1500)).then((val){

//print(val);
AppContext.navigatorKey.currentContext?.back();
AppContext.navigatorKey.currentContext?.pushAndRemoveUntil(const AppFrame(),(_)=>false);



      }



      );

    }
  }

  decrementIndex() {
    screenIndex.value--;
  }

  List<Widget> get screens => [
        PhoneNumberValidation(registrationController: this),
        OtpVerification(registrationController: this),
       // TermsAndConditions(registrationController: this),
        RegistrationInformation(registrationController: this),
        IdsDetail(registrationController: this),
        IdScanDetail(registrationController: this),
        KycDetail(registrationController: this),
        KycDetailsCheck(registrationController: this),
        PersonalDetails(registrationController: this),
        JobDetails(registrationController: this),
        HomeDetails(registrationController: this),
        AccountDetailss(registrationController: this),
        LoginCredentials(registrationController: this),
      ];

  String countryCode = '+964';
  int? liveInIraq;
  int? firstDegreeRelatives;
  int? areYouUsingAccount;
  int? usCitizen;
  int? sector;
  bool idPhoto = true;
  bool livePhoto = false;
}
