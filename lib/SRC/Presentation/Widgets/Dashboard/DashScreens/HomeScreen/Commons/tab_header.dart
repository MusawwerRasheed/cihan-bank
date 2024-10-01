import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({
    super.key,
    required this.themeData,
    required TabController tabController,
    this.onChange,
  }) : _tabController = tabController;

  final ThemeData themeData;
  final TabController _tabController;
  final Function(int i)? onChange;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onChange,
      padding: const EdgeInsets.all(0),
      unselectedLabelStyle: themeData.textTheme.labelLarge!.copyWith(
        color: LightColorsPalate.tabsTextColor,
      ),
      labelStyle: themeData.textTheme.labelLarge!.copyWith(
        color: themeData.colorScheme.primary,
      ),
      controller: _tabController,
      dividerColor: LightColorsPalate.dividerColor,
      tabs: const [
        Tab(text: "Explore"),
        Tab(text: "Transactions"),
        Tab(text: "Services"),
      ],
    );
  }
}
