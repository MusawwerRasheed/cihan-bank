import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/custom_chip.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  List<bool> ifExpanded = List<bool>.filled(2, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
          Util.serviceTitle.length,
          (outerIndex) => CustomChip(
            expandOntap: () {
              setState(() {
                ifExpanded[outerIndex] = !ifExpanded[outerIndex];
              });
            },
            ifExpanded: ifExpanded[outerIndex],
            title: Util.serviceTitle[outerIndex],
            subTitle: Util.serviceSubTitle[outerIndex],
            bottomOntap: () {},
            child: SizedBox(
              height: 100.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, innerIndex) {
                  return SizedBox(
                    height: 130.h,
                    width: 100.w,
                    child: AssetImageWidget(
                      url: Util.serviceImages[outerIndex][innerIndex],
                      fit: BoxFit.scaleDown,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 0.w),
                itemCount: Util.serviceImages[outerIndex].length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
