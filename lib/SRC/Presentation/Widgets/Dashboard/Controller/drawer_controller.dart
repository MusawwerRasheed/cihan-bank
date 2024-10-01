import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CustomDrawerController {
  static ValueNotifier<int> drawerIndex = ValueNotifier(0);
  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
  static final List<Widget> screens = [
    const LatestTransaction(),
    const AccountBalance(),
    const RequestStatement(),
    AccountDetails(),
    const Vouchers(),
    const SettingScreen(),
    const RequestStatement(),
    AccountDetails(),
    const Vouchers(),
    const SettingScreen()
  ];
  static final List<DrawerModel> drawerItems = [
    DrawerModel(
      title: 'Home',
      iconPath: Assets.icons.homeLight,
    ),
    DrawerModel(
      title: 'Account Details',
      iconPath: Assets.icons.userAltLight,
    ),
    DrawerModel(
      title: 'Card Details',
      iconPath: Assets.icons.creditCardLight,
    ),
    DrawerModel(
      title: 'Transfer Services',
      iconPath: Assets.icons.sortArrowLight,
    ),
    DrawerModel(
      title: 'Latest transactions ',
      iconPath: Assets.icons.paperIcon,
    ),
    DrawerModel(
      title: 'Account Balance',
      iconPath: Assets.icons.walletIcon,
    ),
    DrawerModel(
      title: 'Nearest Bank',
      iconPath: Assets.icons.fileDockIcon,
    ),
    DrawerModel(
      title: 'Contact Support',
      iconPath: Assets.icons.userAltLight,
    ),
    DrawerModel(
      title: 'My Profile',
      iconPath: Assets.icons.userCicrleLight,
    ),
    DrawerModel(
      title: 'Settings',
      iconPath: Assets.icons.settingIcon,
    ),
  ];

  static setIndex(int index) {
    drawerIndex.value = index;
    selectedIndex.value = index;
    selectedIndex.notifyListeners();
    drawerIndex.notifyListeners();
  }
}
