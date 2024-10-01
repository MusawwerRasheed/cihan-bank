import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class BackRedWidget extends StatelessWidget {
  const BackRedWidget({
    super.key,
    required this.scaffoldKey,
    required this.child,

    this.title,
    this.isSearch,
    this.textEditingController, this.topChild, this.topMargin,
  });
final Widget? topChild;
final double? topMargin;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget child;
  final String? title;
  final bool? isSearch;

  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh + 1.stB,
      width: 1.sw,
      child: Stack(
        //fit: StackFit.expand,
        children: [
          // Positioned(
          //   right: 0,
          //   left: 300,
          //   top: 45,
          //   child: ,
          // ),

          Container(
            width: double.infinity,
            height: 1.sh,
            // padding: EdgeInsets.only(left: 0),
            // alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.splashTopRight.path),
                  alignment: Alignment.topLeft),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  LightColorsPalate.gred2Color,
                  LightColorsPalate.gred2Color,
                  LightColorsPalate.gred3Color,
                ],
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                num.parse((1.stB + 10).toString()).y,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    20.x,
                    Container(
                        width: 41.w,
                        height: 41.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              size: 20.h,
                            ))).onTapped(onTap: () {
                      context.back();
                    }),
                    const Spacer(),
                    AppText(
                      title ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    AssetImageWidget(
                      url: Assets.icons.menuSortIcon,
                      fit: BoxFit.fitHeight,
                    ).onTapped(onTap: () {
                      scaffoldKey?.currentState?.openDrawer();
                    }),
                    20.x,
                  ],
                ),
                30.y,
              ],
            ),
          ),

          AnimatedPositioned(
            left: 60,
            right: 0,
            top: 150,
            duration: const Duration(milliseconds: 200),
            child: AssetImageWidget(
              url: Assets.images.splashSideImg.path,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: topMargin ?? 120,
              child: isSearch == true
                  ? AppTextField(
                  controller:
                  textEditingController ?? TextEditingController(),
                  textInputType: TextInputType.text,
                  hintText: 'search',
                  //prefixWidth: 100,

                  prefixIcon: DynamicAppIconHandler.buildIcon(
                      context: context,
                      svg: Assets.icons.searchIcon,
                      fit: BoxFit.scaleDown))
                  .padHorizontal(24)
                  : topChild!=null? topChild! : 0.y),
          // Positioned(
          //
          //   left: -350,
          //   right: 0,
          //   top: 0,
          //   bottom: 200,
          //   child: AssetImageWidget(
          //     url: Assets.images.splashTopRight.path,
          //     width: double.infinity,
          //     fit: BoxFit.fitWidth,
          //   ),
          // ),

          child!
        ],
      ),
    );
  }
}