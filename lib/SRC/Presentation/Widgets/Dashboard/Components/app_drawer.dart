import 'dart:developer';

import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    log("asjdgjasgd");
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      width: 1.sw / 1.3,
      backgroundColor: themeData.colorScheme.background,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.images.fullTemplate.path))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              90.y,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    'Hi Sarwar,',
                    style: themeData.textTheme.headlineMedium
                        ?.copyWith(color: themeData.colorScheme.onPrimaryFixed),
                    maxLine: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ).pad(EdgeInsets.only(left: 30.rSA)),
              AppText(
                'Last login 22 April, 2024 12:34 PM',
                style: themeData.textTheme.titleSmall
                    ?.copyWith(color: themeData.colorScheme.tertiary),
                maxLine: 2,
                overflow: TextOverflow.ellipsis,
              ).pad(EdgeInsets.only(left: 30.rSA)),
              10.y,
              ValueListenableBuilder(
                builder: (context, sIndex, ss) {
                  return Column(
                          children: CustomDrawerController.drawerItems
                              .mapIndexed((index, element) {
                    return Column(
                      children: [
                        index == 8 ? 50.y : 10.y,
                        index == 8
                            ? const Divider(
                                thickness: 2,
                              )
                            : 0.y,
                        Container(
                          margin: index == 8
                              ? const EdgeInsets.only(top: 20)
                              : null,
                          padding: EdgeInsets.only(left: 10.w),
                          decoration: sIndex == index
                              ? BoxDecoration(
                                  color: LightColorsPalate.greyColor
                                      .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(14))
                              : null,
                          child: ListTile(
                            onTap: () {
                              CustomDrawerController.setIndex(index);

                              context.back();
                              context.to(
                                CustomDrawerController.screens[index],
                              );
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: AssetImageWidget(url: element.iconPath!),
                            title: AppText(
                              element.title!,
                              style: themeData.textTheme.bodyLarge
                                  ?.copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList())
                      .padHorizontal(24);
                },
                valueListenable: CustomDrawerController.selectedIndex,
              ),
              ListTile(
                onTap: () {
                  //CustomDrawerController.setIndex(index);
                  // context.back();
                },
                contentPadding: EdgeInsets.only(left: 5.fS),
                leading: AssetImageWidget(
                  url: Assets.icons.signoutIcon,
                  fit: BoxFit.fill,
                  height: 23,
                  width: 23,
                ),
                title: AppText(
                  onTap: () {
                    CommonDialogs.showCommonDialogue(
                        svgPath: Assets.icons.signoutIcon,
                        iconColor: themeData.colorScheme.primary,
                        closeIconColor: themeData.colorScheme.background,
                        showCloseIcon: true,
                        iconHeight: 55.rSA,
                        context: context,
                        title: 'Are you sure you want to',
                        titleTextSize: 20.fS,
                        titleFontWeight: FontWeight.w400,
                        description: 'sign out?',
                        descriptionTextSize: 20,
                        descriptionFontWeight: FontWeight.bold,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        actions: [
                          CommonButton(
                            horizontalMargin: 0,
                            onTap: () {},
                            text: 'Yes',
                          ),
                          CommonButton(
                            verticalMargin: 0,
                            backgroundColor: themeData.colorScheme.tertiary,
                            textColor: themeData.colorScheme.background,
                            horizontalMargin: 0,
                            onTap: () {},
                            text: 'Cancel',
                          ),
                        ]);
                  },
                  "Sign Out",
                  style: themeData.textTheme.bodyLarge?.copyWith(
                      fontSize: 18, color: themeData.colorScheme.primary),
                ),
              ).padHorizontal(24),
              Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.all(10.rSA),
                    child: AssetImageWidget(
                      url: Util.socialIcons[index],
                      height: index == 0 ? 59 : 25,
                    ),
                  ),
                ),
              ).padHorizontal(19.fS),
              30.y
            ],
          ),
        ),
      ),
    );
  }
}
