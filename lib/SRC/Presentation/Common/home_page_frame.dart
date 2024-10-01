import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePageFrame extends StatefulWidget {
  const HomePageFrame({
    super.key,
    required this.widget,
    required this.themeData,
    required this.child,
  });
  final Widget child;
  final HomeMasterScreen widget;
  final ThemeData themeData;

  @override
  State<HomePageFrame> createState() => _HomePageFrameState();
}

class _HomePageFrameState extends State<HomePageFrame> {
  bool isAccountNumberVisible = true;

  void _toggleAccountNumberVisibility() {
    setState(() {
      isAccountNumberVisible = !isAccountNumberVisible;
    });
  }

  String _getObscuredAccountNumber(String accountNumber) {
    int visibleDigits = 0;
    final obscuredPart = '*' * (accountNumber.length - visibleDigits);
    final visiblePart =
        accountNumber.substring(accountNumber.length - visibleDigits);
    return '$obscuredPart$visiblePart';
  }

  @override
  Widget build(BuildContext context) {
    print(1.btB);
    String accountNumber = "17,295.22";
    String displayAccountNumber = isAccountNumberVisible
        ? accountNumber
        : _getObscuredAccountNumber(accountNumber);

    return SizedBox(
      height: 1.sh + 1.stB,
      width: 1.sw,
      child: Stack(children: [
        //Background
        Container(
          width: double.infinity,
          height: 1.sh,
          // alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                LightColorsPalate.gred2Color,
                LightColorsPalate.gred2Color,
                LightColorsPalate.gred3Color,
              ],
            ),
          ),
        ),
        Positioned(
          left: -350,
          right: 0,
          top: 0,
          bottom: 200,
          child: AssetImageWidget(
            url: Assets.images.splashTopRight.path,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          right: 0,
          left: 300,
          top: 45,
          child: AssetImageWidget(
            url: Assets.icons.menuSortIcon,
            fit: BoxFit.fitHeight,
          ).onTapped(onTap: () {
            widget.widget.scaffoldKey.currentState?.openDrawer();
          }),
        ),
        Positioned(
          left: 60,
          right: 0,
          top: 120,
          child: AssetImageWidget(
            url: Assets.images.splashSideImg.path,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          right: 0,
          left: 20,
          top: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                "Hi Sarwar!",
                style: widget.themeData.textTheme.headlineLarge!.copyWith(
                    fontSize: 32,
                    color: widget.themeData.colorScheme.background),
              )
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 700))
                  .flipV(duration: const Duration(milliseconds: 600)),
              AppText(
                "8500-4395-004-1254",
                style: widget.themeData.textTheme.bodySmall!
                    .copyWith(color: widget.themeData.colorScheme.background),
              ),
              7.y,
              AppText(
                "${displayAccountNumber},IQD",
                style: widget.themeData.textTheme.bodyLarge!.copyWith(
                    fontSize: 50.fS,
                    color: widget.themeData.colorScheme.background),
              )
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 700))
                  .flipV(duration: const Duration(milliseconds: 600)),
              Row(
                children: [
                  AppText(
                    "Saving Account",
                    style: widget.themeData.textTheme.bodySmall!.copyWith(
                        color: widget.themeData.colorScheme.background),
                  ),
                  GestureDetector(
                    onTap: _toggleAccountNumberVisibility,
                    child: AssetImageWidget(
                      url: Assets.icons.viewHideIcon,
                      fit: BoxFit.contain,
                      color: widget.themeData.colorScheme.background,
                    ).padHorizontal(5),
                  ),
                ],
              ),
            ],
          ),
        ),

        Align(alignment: Alignment.bottomCenter, child: widget.child),
      ]),
    );
  }
}
