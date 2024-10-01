import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/CommonCardsSliderWidget.dart';

class AccountsManagementScreen extends StatefulWidget {
  const AccountsManagementScreen({super.key});

  @override
  State<AccountsManagementScreen> createState() =>
      _AccountsManagementScreenState();
}

class _AccountsManagementScreenState extends State<AccountsManagementScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(
            horizontalPad: 24.fS,
            actionIcon: Assets.icons.sortIcon,
            scaffoldKey: _scaffoldKey,
          ),
          30.y,
          AppText(
            'Accounts Management',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 22.fS,
            ),
          ).padHorizontal(24),
          AppText(
            'Select the card you want to edit',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 14),
          ).padHorizontal(24),
          30.y,
          Expanded(
              child: ListView(
            children: [
              const CommonCardSlider(),
              30.y,
              Center(child: AssetImageWidget(url: Assets.images.qrImg.path)),
              10.y,
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.north_east,
                      size: 10,
                      color: theme.colorScheme.error,
                    ),
                    6.x,
                    AppText(
                      'Share QR code',
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
              30.y,
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.edit,
                      size: 10,
                      color: LightColorsPalate.blueBorderColor,
                    ),
                    6.x,
                    AppText(
                      'Edit',
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: LightColorsPalate.blueBorderColor,
                      ),
                    ),
                  ],
                ),
              ).padHorizontal(24),
              30.y,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  children: [
                    DynamicAppIconHandler.buildIcon(
                        context: context, svg: Assets.icons.fingerPrintIcon),
                    10.x,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'Activate finger print',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 16.fS,
                            ),
                          ),
                          AppText(
                            'Your finger print is activated ',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 11.fS,
                            ),
                          )
                        ],
                      ),
                    ),
                    Switch(value: false, onChanged: (v) {})
                  ],
                ),
              ).padHorizontal(24),
              30.y,
              AppText(
                'Update Password',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 22.fS,
                ),
              ).padHorizontal(24),
              12.y,
              AppTextField(
                controller: TextEditingController(),
                textInputType: TextInputType.text,
                hintText: 'New password',
              ).padHorizontal(24),
              12.y,
              AppTextField(
                controller: TextEditingController(),
                textInputType: TextInputType.text,
                hintText: 'Repeat password',
              ).padHorizontal(24),
              100.y,
            ],
          ))
        ],
      ),
      bottomNavigationBar: CommonButton(
        onTap: () {},
        text: 'Update',
        horizontalMargin: 24,
        verticalMargin: 16,
      ),
    );
  }
}
