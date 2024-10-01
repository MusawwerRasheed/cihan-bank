import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Styles/app_textstyles.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/bottom_sheet.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transactions/Components/select_account_block.dart';

class SelectAccountContent extends StatelessWidget {
  const SelectAccountContent({
    super.key,
    required this.themeData,
    this.containerHeight,
    required this.allTransferServices,
    this.dockVisibility,
    this.topPadding,
    required this.allTransferServicesTexts,
  });

  final ThemeData themeData;
  final bool? dockVisibility;
  final double? topPadding;
  final double? containerHeight;
  final List allTransferServices;
  final List<String> allTransferServicesTexts;

  void function1(BuildContext context) {
    CustomBottomSheet().showBottomSheet(
        context,
        SelectAccountContent(
            themeData: themeData,
            allTransferServices: allTransferServices,
            allTransferServicesTexts: allTransferServicesTexts));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight ?? 550,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 5,
                  color: LightColorsPalate.lightGreyColor,
                ).pad(const EdgeInsets.only(top: 30, right: 20)),
 
                AppText(
                  'Select Account',
                  style: AppTextStyles.poppinsRegular(),
                ).pad(
                  EdgeInsets.only(top: 10),
 
                ),
              ],
            ),
          ).pad(const EdgeInsets.only(bottom: 10)),
          const SizedBox(height: 20),
          SelectAccountBlock(themeData: themeData),
          CommonButton(onTap: () {}, text: 'Select')
              .pad(EdgeInsets.only(top: topPadding ?? 80)),
        ],
      ).pad(EdgeInsets.only(left: 20)),
    );
  }
}

