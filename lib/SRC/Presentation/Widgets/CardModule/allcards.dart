import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/card_widget.dart';

class AllCards extends StatefulWidget {
  const AllCards({super.key});

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(drawer: AppDrawer(scaffoldKey: _scaffoldKey,),

    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      SizedBox(height: 1.stB + 18),
      TopBar(
        horizontalPad: 0,
        actionIcon: Assets.icons.sortIcon,
        scaffoldKey: _scaffoldKey,
      ),
      30.y,
      AppText("All Cards",style: theme.textTheme.bodyMedium,),

        30.y,
         const Expanded(child: Align(
            alignment: Alignment.topCenter,
            child: CardSwipe()))

    ],).padHorizontal(10),
    );
  }

  void _onCardPressed() {

    print("pressed");
  }
}
