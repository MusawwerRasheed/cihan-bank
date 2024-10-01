import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/favourite_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/TransactionDetailCalender/transaction_detail_calender.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/setting_model.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/settings_tile.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/AccountsManagement/account_management_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/AuthorizedCountries/authorized_countries_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/BankingToday/banking_today_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Calender/pending_order_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/CheckServices/check_services_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final settingsTabs = [
      SettingModel(
        title: 'Authorized countries',
        iconPath: Assets.icons.flagFinishIcon,
        onTap: () {
          context.to(const AuthorizedCountriesScreen());
        },
      ),
      SettingModel(
        title: 'Accounts management',
        iconPath: Assets.icons.creditCardIcon,
        onTap: () {
          context.to(const AccountsManagementScreen());
        },
      ),
      SettingModel(
        title: 'Pending orders',
        iconPath: Assets.icons.dellIcon,
        onTap: () {
          context.to(const PendingOrderScreen());
        },
      ),
      SettingModel(
        title: 'Charge',
        iconPath: Assets.icons.archieveIcon,
        onTap: () {
          context.to(const CheckServiceScreen());
        },
      ),
      SettingModel(
        title: 'Calendar',
        iconPath: Assets.icons.calenderIcon,
        onTap: () {
          context.to(const TransactionDetailCalender());
        },
      ),
      SettingModel(
        title: 'Todays bank services',
        iconPath: Assets.icons.boxOpenIcon,
        onTap: () {
          context.to(const BankingTodayScreen());
        },
      ),
      SettingModel(
        title: 'Locations',
        iconPath: Assets.icons.mapIcon,
        onTap: () {},
      ),
      SettingModel(
        title: 'Banks list',
        iconPath: Assets.icons.deskIcon,
        onTap: () {},
      ),
      SettingModel(
        title: 'Favourite',
        iconPath: Assets.icons.favorites,
        onTap: () {
          context.to(const FavoriteScreen());
        },
      ),
    ];
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(
            horizontalPad: 24,
            actionIcon: Assets.icons.sortIcon,
            scaffoldKey: _scaffoldKey,
          ),
          30.y,
          AppText(
            'Settings',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 22,
            ),
          ).padHorizontal(24),
          AppText(
            'Reach farther pages from settings',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 14),
          ).padHorizontal(24),
          30.y,
          Expanded(
            child: ListView.separated(
              itemCount: settingsTabs.length,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              itemBuilder: (BuildContext context, int index) => SettingTile(
                leadingIconPath: settingsTabs[index].iconPath,
                title: settingsTabs[index].title,
                onTap: settingsTabs[index].onTap,
                titleColor: index == 8 ? LightColorsPalate.errorColor : null,
                color: index == 8 ? LightColorsPalate.errorColor : null,
              ),
              separatorBuilder: (BuildContext context, int index) => 14.y,
            ),
          ),
        ],
      ),
    );
  }
}
