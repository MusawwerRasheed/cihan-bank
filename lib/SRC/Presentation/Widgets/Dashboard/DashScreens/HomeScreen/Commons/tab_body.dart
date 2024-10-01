import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/services_tab.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/transection_tab.dart';

class TabBody extends StatefulWidget {
  const TabBody({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  State<TabBody> createState() => _TabBodyState();
}

class _TabBodyState extends State<TabBody> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      height: 1.sh,
      child: TabBarView(
        controller: widget._tabController,
        children: const [
          ExploreScreen(),
          TransectionTab(),
          ServicesTab(),
        ],
      ),
    );
  }
}
