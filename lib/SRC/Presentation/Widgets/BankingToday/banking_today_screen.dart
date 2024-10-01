import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/BankingToday/Components/banking_today_tile.dart';

class BankingTodayScreen extends StatefulWidget {
  const BankingTodayScreen({super.key});

  @override
  State<BankingTodayScreen> createState() => _BankingTodayScreenState();
}

class _BankingTodayScreenState extends State<BankingTodayScreen> {
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
            actionIcon: Assets.icons.sortIcon,
            scaffoldKey: _scaffoldKey,
          ),
          30.y,
          AppText(
            'Banking today',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 22,
            ),
          ),
          AppText(
            'Last dates of ...',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 14),
          ),
          30.y,
          ...List.generate(
              4,
              (index) => const BankingTodayTile(
                      leadingText: '2023-04 02',
                      title: 'Latest successful entrance',
                      subtitle: '08:44:48')
                  .padVertical(8))
        ],
      ).padHorizontal(24),
    );
  }
}
