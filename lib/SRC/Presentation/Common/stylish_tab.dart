import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class StylishTab extends StatefulWidget {
  const StylishTab({
    super.key,
    required this.themeData,
    required this.selectedTab,
    required this.firstTab,
    required this.secondTab,
    this.initialVal,
  });

  final ThemeData themeData;

  final void Function(int val) selectedTab;
  final String firstTab;
  final String secondTab;
  final int? initialVal;

  @override
  State<StylishTab> createState() => _StylishTabState();
}

class _StylishTabState extends State<StylishTab> {
  int selectedVal = 0;
  @override
  void initState() {
    if (widget.initialVal != null) {
      selectedVal = widget.initialVal!;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 70.h,
      decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(60.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: selectedVal == 0
                  ? Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.r)),
                      child: Center(child: AppText(widget.firstTab)))
                  : AppText(
                      widget.firstTab,
                      style: widget.themeData.textTheme.bodySmall
                          ?.copyWith(fontSize: 20.fS),
                    ),
            ).onTapped(onTap: () {
              _selectedTabChange(0);
            }),
          ),

          // Spacer(),
          Expanded(
              child: SizedBox(
            child: selectedVal == 1
                ? Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.r)),
                    child: Center(
                        child: AppText(
                      widget.secondTab,
                    )))
                : Center(
                    child: AppText(
                    widget.secondTab,
                    style: widget.themeData.textTheme.bodySmall
                        ?.copyWith(fontSize: 20.fS),
                  )),
          ).onTapped(onTap: () {
            _selectedTabChange(1);
          })),
          10.x,
        ],
      ),
    );
  }

  void _selectedTabChange(int current) {
    if (selectedVal != current) {
      if (selectedVal == 0) {
        selectedVal = 1;
        widget.selectedTab(1);
      } else {
        selectedVal = 0;
        widget.selectedTab(0);
      }
      setState(() {});
    }
  }
}
