import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/listview_item.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/LatestTransaction/AllTransectionScreen.dart';

class LatestTransaction extends StatefulWidget {
  const LatestTransaction({super.key});

  @override
  _LatestTransactionState createState() => _LatestTransactionState();
}

class _LatestTransactionState extends State<LatestTransaction> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const AllTransactionScreen(),
    const AllTransactionScreen(),
    const Text('Account Balance ',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    const Text('Discount Details',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          50.y,
          TopBar().padHorizontal(29),
          25.y,
          AppText(
            "Transition Type",
            style: themeData.textTheme.bodyLarge!
                .copyWith(color: themeData.colorScheme.onPrimaryFixed),
          ).padHorizontal(29),
          AppText(
            "Select of the following",
            style: themeData.textTheme.bodySmall,
          ).padHorizontal(29),
          16.y,
          SizedBox(
            height: 84.h,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ListViewItem(
                  pad: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  text: 'All',
                  icon: Assets.icons.layersIcon,
                  isSelected: _selectedIndex == 0,
                  onTap: () => _onItemTapped(0),
                ),
                const SizedBox(width: 10),
                ListViewItem(
                  pad: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  text: 'Credit',
                  icon: Assets.icons.bookmarkIcon,
                  isSelected: _selectedIndex == 1,
                  onTap: () => _onItemTapped(1),
                ),
                const SizedBox(width: 10),
                ListViewItem(
                  pad: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  text: 'Discount',
                  icon: Assets.icons.percentIcon,
                  isSelected: _selectedIndex == 2,
                  onTap: () => _onItemTapped(2),
                ),
              ],
            ),
          ).padHorizontal(5),
          43.y,
          _widgetOptions.elementAt(_selectedIndex + 1).padHorizontal(29),
        ],
      ),
    );
  }
}
