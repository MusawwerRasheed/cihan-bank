import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/explore_chips.dart';

class ExploreChipSection extends StatelessWidget {
  final VoidCallback func;
  final int index;
  final bool ifExpanded;
  final List<String> icons;
  final List<String> texts;
  final Widget child;
  final Color color;
  final void Function(int subIndex, String subTitle)? subChildTap;
  const ExploreChipSection({
    this.subChildTap,
    required this.func,
    required this.index,
    required this.ifExpanded,
    required this.child,
    required this.icons,
    required this.color,
    required this.texts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExploreChips(
      ExploreChips.new,
      func: func,
      indexes: index,
      subChildTap: subChildTap,
      ifExpanded: ifExpanded,
      icons: icons,
      texts: texts,
      color: color,
      child: child,
    );
  }
}
