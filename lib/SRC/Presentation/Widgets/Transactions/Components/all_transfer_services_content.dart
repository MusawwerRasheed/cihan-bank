import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/bottom_sheet.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transactions/Components/select_account_content.dart';

class AllTransferServicesContent extends StatelessWidget {
  const AllTransferServicesContent({
    super.key,
    required this.themeData,
    this.containerHeight,
    required this.allTransferServices,
    this.dockVisibility,
    this.topPadding,
    required this.allTransferServicesTexts,
    this.buttonText,
  });

  final ThemeData themeData;
  final bool? dockVisibility;
  final double? topPadding;
  final double? containerHeight;
  final List allTransferServices;
  final List<String> allTransferServicesTexts;
  final String? buttonText;

  void function1(BuildContext context) {
    CustomBottomSheet().showBottomSheet(
        context,
        SelectAccountContent(
            themeData: themeData,
            allTransferServices: allTransferServices,
            allTransferServicesTexts: allTransferServicesTexts));
    CommonButton(onTap: () {}, text: 'Next')
        .pad(const EdgeInsets.only(top: 80));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight ?? 550,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Visibility(
              visible: dockVisibility ?? true,
              child: Container(
                width: 30,
                height: 5,
                color: LightColorsPalate.lightGreyColor,
              ).pad(const EdgeInsets.only(top: 30, right: 20)),
            ),
          ).pad(const EdgeInsets.only(bottom: 20)),
          AppText(
            'All Transfer Services',
            style: themeData.textTheme.bodyLarge,
          ),
          AppText(
            'You can choose one transfer service',
            style: themeData.textTheme.bodySmall!.copyWith(
              color: LightColorsPalate.arrowGreyColor,
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: allTransferServices.length, // Use dynamic itemCount
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 1 || index == 2) {
                    function1(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: LightColorsPalate.dialogBackColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AssetImageWidget(url: allTransferServices[index]),
                      const SizedBox(height: 8),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 90),
                        child: AppText(
                          maxLine: 2,
                          textAlign: TextAlign.center,
                          allTransferServicesTexts[index],
                          style: themeData.textTheme.titleSmall!.copyWith(
                            color: themeData.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).pad(const EdgeInsets.only(right: 20)),
          CommonButton(onTap: () {}, text: buttonText ?? 'Next')
              .pad(EdgeInsets.only(top: topPadding ?? 80)),
        ],
      ).pad(const EdgeInsets.only(left: 20)),
    );
  }
}
