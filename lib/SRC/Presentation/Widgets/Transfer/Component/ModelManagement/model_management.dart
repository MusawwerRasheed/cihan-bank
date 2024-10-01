import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/stylish_tab.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transfer/Component/ModelManagement/createModel.dart';

class ModelManagement extends StatefulWidget {
  const ModelManagement({super.key, this.innerBank});

  final bool? innerBank;

  @override
  State<ModelManagement> createState() => _ModelManagementState();
}

class _ModelManagementState extends State<ModelManagement> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 90.h),
            physics: const BouncingScrollPhysics(),
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.stB + 18.h),
              TopBar(),
              30.y,
              Container(
                height: 90.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.r),
                    border: Border.all(color: themeData.colorScheme.tertiary)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          "Do You want to add a \n Model Management?",
                          maxLine: 2,
                          style: themeData.textTheme.bodyLarge
                              ?.copyWith(fontSize: 16),
                        ),
                        // AppText('You can save your data for next time ',style: themeData.textTheme.bodySmall?.copyWith(
                        //     fontSize: 12.fS
                        // ),),
                      ],
                    ).pad(EdgeInsets.only(left: 20.rSA)),
                    const Spacer(),
                    Switch(
                            value: true,
                            activeColor: LightColorsPalate.successColor,

                            //activeTrackColor: Colors.black,
                            inactiveTrackColor:
                                themeData.colorScheme.tertiary.withOpacity(0.5),
                            trackOutlineColor:
                                MaterialStateProperty.all(Colors.transparent),
                            thumbColor: MaterialStateProperty.all(
                                LightColorsPalate.successColor),
                            onChanged: (val) {})
                        .withMargin(const EdgeInsets.only(right: 20))
                  ],
                ),
              ),
              20.y,
              StylishTab(
                themeData: themeData,
                selectedTab: (val) {
                  print(val);
                },
                firstTab: 'Out',
                secondTab: 'Inner',
              ),

              20.y,
              AppText(
                'Accounts',
                style: themeData.textTheme.bodyMedium,
              ),

              const CommonInnerModelWidget(
                firstStr: 'From account',
                fistVal: 'Mousa09cjd8',
                secondStr: 'To account',
                secondVal: 'Mama',
                thirdStr: "Amount",
                thirdVal: "200000 IQD",
                fourthStr: "Scheduling",
                fourthVal: "",
              ),
              10.y,
              // AppText('Beneficiary communication',style: themeData.textTheme.bodyLarge,),

              const CommonInnerModelWidget(
                firstStr: 'From account',
                fistVal: 'Mousa09cjd8',
                secondStr: 'To account',
                secondVal: 'Mama',
                thirdStr: "Amount",
                thirdVal: "200000 IQD",
                fourthStr: "Scheduling",
                fourthVal: "",
              )
            ],
          ).padHorizontal(24),
          Positioned(
              bottom: 0,
              left: 24,
              right: 24,
              child: CommonButton(
                text: 'Confirmation',
                onTap: () {
                  context.to(CreateModelMangement());
                },
              ))
        ],
      ),
    );
  }
}

class CommonInnerModelWidget extends StatelessWidget {
  const CommonInnerModelWidget(
      {super.key,
      this.firstStr,
      this.fistVal,
      this.secondStr,
      this.secondVal,
      this.thirdStr,
      this.thirdVal,
      this.fourthStr,
      this.fourthVal});

  final String? firstStr;
  final String? fistVal;
  final String? secondStr;
  final String? secondVal;
  final String? thirdStr;
  final String? thirdVal;
  final String? fourthStr;
  final String? fourthVal;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      height: 280.h,
      decoration: BoxDecoration(
          color: const Color(0xffF4F6F7),
          borderRadius: BorderRadius.circular(20.rSA)),
      child: Column(
        children: [
          InnerRow(
            firstStr: firstStr,
            firstVal: fistVal,
          ),
          InnerRow(
            firstStr: secondStr,
            firstVal: secondVal,
          ),
          InnerRow(
            firstStr: thirdStr,
            firstVal: thirdVal,
            fromThird: true,
          ),
          InnerRow(
            firstStr: fourthStr,
            firstVal: fourthVal,
          ),
          const Divider(),
          CommonButton(
            onTap: () {},
            text: 'Transfer',
            textSize: 16.fS,
            backgroundColor: LightColorsPalate.successColor,
            height: 40,
          )
        ],
      ).padHorizontal(20).pad(const EdgeInsets.only(top: 20)),
    );
  }
}

class InnerRow extends StatelessWidget {
  const InnerRow({super.key, this.firstStr, this.firstVal, this.fromThird});
  final String? firstStr;
  final String? firstVal;
  final bool? fromThird;
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Row(children: [
      AppText(
        firstStr ?? "",
        style: themeData.textTheme.bodyLarge?.copyWith(fontSize: 15),
      ),
      const Spacer(),
      AppText(
        firstVal ?? "",
        style: themeData.textTheme.bodySmall?.copyWith(
            fontSize: 13,
            color: fromThird != null ? LightColorsPalate.successColor : null),
      )
    ]).withMargin(EdgeInsets.only(bottom: 20.rSA));
  }
}
