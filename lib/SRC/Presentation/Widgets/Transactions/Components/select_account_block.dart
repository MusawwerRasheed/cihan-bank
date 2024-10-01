import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Styles/app_textstyles.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/bottom_sheet.dart';

class SelectAccountBlock extends StatelessWidget {
  const SelectAccountBlock({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: Util.selectAccountTitles.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: themeData.colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                AssetImageWidget(url: Util().selectAccountIcons[index]),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        Util.selectAccountTitles[index],
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      AppText(
                        Util.selectAccountSubtitles[index],
                        style: themeData.textTheme.bodyLarge!.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                AssetImageWidget(
                    url: Assets.icons.arrowIosIcon), // Right arrow icon
              ],
            ),
          ).padHorizontal(24).padVertical(7);
        },
      ),
    );
  }
}
