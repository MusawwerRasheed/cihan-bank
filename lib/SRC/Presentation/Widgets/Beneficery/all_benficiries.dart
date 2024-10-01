import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/benficaryModel.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/Components/expanded_widget.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/Components/top_back_widget.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/benificairyPage.dart';

import 'Components/benficiary_container.dart';

class AllBenficiries extends StatefulWidget {
  const AllBenficiries({super.key,  this.widget});
  final HomeMasterScreen? widget;
  @override
  State<AllBenficiries> createState() => _AllBenficiriesState();
}

final GlobalKey<ScaffoldState> _scaffoldKeyB = GlobalKey<ScaffoldState>();

class _AllBenficiriesState extends State<AllBenficiries> {
  bool? isExpanded = false;
List<Benficarymodel> dto= [
  
  Benficarymodel(name: "Mousa Mohammed", bankACCOUNT: "Chian Bank", accountCode: "987890-23"),
  Benficarymodel(name: "Mousa Mohammed", bankACCOUNT: "Chian Bank", accountCode: "987890-23")
  ,
  Benficarymodel(name: "Mousa Mohammed", bankACCOUNT: "Chian Bank", accountCode: "987890-23")
  
];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKeyB,
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(scaffoldKey: _scaffoldKeyB),
      body: BackRedWidget(
        scaffoldKey: _scaffoldKeyB,
        title: 'All Beneficiaries',
        isSearch: true,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 0.67.sh,
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 60),
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionCustom(
                    dto: dto[index],
                      isExpansionChanged: (bool? val) {
                        //isExpanded = val;
                        // setState(() {});
                      },
                      isExpanded: isExpanded);
                },
                separatorBuilder: (BuildContext context, int index){ return 10.y; }, itemCount: dto.length,
            
              ),
            )).stackIt([
          Positioned(
              //bottom: 0,
              left: 50,
              top: 270.h,
              right: 50,
              child: Align(
                child: Container(
                  width: 260,
                  height: 85,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F807E8C),
                        blurRadius: 16.80,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BenficiaryContainer(
                        title: "Add New beneficiary",
                        svgPath: Assets.icons.addBenificairIcon,
                      ).onTapped(onTap: (){
                        context.to(const BenficiaryIndivdualPage(widget: null));

                      }),
                      BenficiaryContainer(
                        title: "Beneficiary accounts",
                        svgPath: Assets.icons.accountBenificaryIcon,
                      ),
                      BenficiaryContainer(
                        isSelected: true,
                        title: "View all beneficiary",
                        svgPath: Assets.icons.viewAllIcon,
                      ),
                    ],
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}






