import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Styles/app_textstyles.dart';

class AllowSheetWidget extends StatelessWidget {
  const AllowSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20.rSA),
      decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(12)),
      height: 1.sh/1.45,
      width: 1.sw,

      child: Column(

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          20.y,
          Container(color: Colors.grey.withOpacity(0.5), height: 3,width: 50.w,),
          70.y,
          AssetImageWidget(url: Assets.images.facIdImage.path),
          33.y,

          AppText('A code has been sent to your \n           phone number ',
            maxLine: 2,
            style: AppTextStyles.poppinsRegular(color: const Color(0xFF5C5C5C)),),
          const Spacer(),
          CommonButton(onTap: _onAllowTap,text: 'Allow',textColor: Colors.white,backgroundColor:  const Color(0xFF2EC748), )
          ,
          5.y,
          CommonButton(onTap: _onDenyTap,text: 'Deny',textColor: Colors.white,backgroundColor:  const Color(0xFFD1D1D1), )
          ,
          20.y,

        ],),

    );
  }

  void _onAllowTap() {

    AppContext.navigatorKey.currentContext?.to(const OtpScreen());

  }


  void _onDenyTap() {
    AppContext.navigatorKey.currentContext?.back();
  }
}