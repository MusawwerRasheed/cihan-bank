import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    ThemeData themeData = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget(
            url: Assets.images.searchDuotoneImg.path,
            height: 0.4.sh,
            width: 0.4.sw,
          ),
          AppText(
            "let’s find out ",
            style: themeData.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
