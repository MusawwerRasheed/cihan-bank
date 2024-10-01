import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/beneficery_input_field.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/tile_button.dart';

class AddBeneficery extends StatefulWidget {
  const AddBeneficery({super.key});

  @override
  State<AddBeneficery> createState() => _AddBeneficeryState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _AddBeneficeryState extends State<AddBeneficery> {
  final List<bool> isExpanded = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      body: Column(
        children: [
          SizedBox(
            height: 1.stB + 18,
          ),
          TopBar(
            horizontalPad: 24,
            actionIcon: Assets.icons.sortIcon,
            scaffoldKey: _scaffoldKey,
          ),
          20.y,
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                SizedBox(
                  height: 212.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                            height: 46.5,
                            child: Stack(
                              children: [
                                AssetImageWidget(
                                    url: Assets.images.header.path),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppText(
                                    '+ Add a new beneficiary',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.background,
                                      fontSize: 16,
                                    ),
                                  ).pad(const EdgeInsets.only(left: 20)),
                                )
                              ],
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 212.h,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              AssetImageWidget(
                                width: double.infinity,
                                url: Assets.images.body.path,
                                fit: BoxFit.fill,
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    80.h.y,
                                    const BeneficaryInputField(
                                        title: 'Beneficiary title'),
                                    10.h.y,
                                    const BeneficaryInputField(
                                        title: 'Account number'),
                                    10.h.y,
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: AppText(
                                        'Confirm',
                                        style:
                                            theme.textTheme.bodySmall!.copyWith(
                                          color: LightColorsPalate.successColor,
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              LightColorsPalate.successColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ).padHorizontal(24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                30.y,
                AppText(
                  'Beneficiary Managment',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 22,
                  ),
                ),
                AppText(
                  'You can edit the beneficiary or delete it',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.tertiary,
                  ),
                ),
                30.y,
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        height: isExpanded[index] ? 220 : 76,
                        duration: const Duration(milliseconds: 200),
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: isExpanded[index] ? 180 : 0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: theme.colorScheme.outline
                                        .withOpacity(0.4),
                                    border: Border.all(
                                      color: theme.colorScheme.outline,
                                    ),
                                  ),
                                  child: isExpanded[index]
                                      ? FutureBuilder(
                                          future: Future.delayed(const Duration(
                                              milliseconds: 200)),
                                          builder: (context, snapshot) =>
                                              snapshot.connectionState ==
                                                      ConnectionState.done
                                                  ? Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        60.y,
                                                        BeneficaryInputField(
                                                          title: 'Account name',
                                                          controller:
                                                              TextEditingController(
                                                            text:
                                                                'Mohammed Ali',
                                                          ),
                                                          readOnly: true,
                                                        ),
                                                        10.y,
                                                        BeneficaryInputField(
                                                          title:
                                                              'Account number',
                                                          controller:
                                                              TextEditingController(
                                                            text:
                                                                '45639485684395',
                                                          ),
                                                          readOnly: true,
                                                        ),
                                                        10.y,
                                                        AppText(
                                                          onTap: () {},
                                                          'Edit',
                                                          style: theme.textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            decorationColor: theme
                                                                .colorScheme
                                                                .primaryContainer,
                                                            color: theme
                                                                .colorScheme
                                                                .primaryContainer,
                                                          ),
                                                        ),
                                                      ],
                                                    ).padHorizontal(24)
                                                  : const Center())
                                      : null),
                            ),
                            TileButton(
                              color: isExpanded[index]
                                  ? LightColorsPalate.blackColor
                                  : theme.colorScheme.error,
                              leading: Icon(
                                isExpanded[index]
                                    ? Icons.keyboard_arrow_down_sharp
                                    : Icons.keyboard_arrow_up_sharp,
                                color: theme.colorScheme.background,
                              ).onTapped(onTap: () {
                                setState(() {
                                  isExpanded[index] = !isExpanded[index];
                                });
                              }),
                              title: 'Beneficiary name',
                              subtitle: 'account number',
                              trailing: DynamicAppIconHandler.buildIcon(
                                context: context,
                                svg: Assets.icons.trashIcon,
                                iconColor: theme.colorScheme.error,
                              ).onTapped(onTap: () {
                                CommonDialogs.showCommonDialogue(
                                    svgPath: Assets.icons.warningIcon,
                                    closeIconColor:
                                        theme.colorScheme.onBackground,
                                    showCloseIcon: true,
                                    iconHeight: 55,
                                    context: context,
                                    title: 'Are you sure you want to',
                                    titleTextSize: 20,
                                    titleFontWeight: FontWeight.w400,
                                    description: 'delete this beneficiary?',
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
                                        backgroundColor:
                                            theme.colorScheme.tertiary,
                                        textColor: theme.colorScheme.background,
                                        horizontalMargin: 0,
                                        onTap: () {},
                                        text: 'Cancel',
                                      ),
                                    ]);
                              }),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => 10.y,
                    itemCount: isExpanded.length),
                100.y,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
