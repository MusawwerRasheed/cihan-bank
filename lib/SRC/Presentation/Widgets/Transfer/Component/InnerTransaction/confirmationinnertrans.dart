import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transfer/Component/InsideBank/otpverify.dart';

class InnerTransactionConfirmation extends StatefulWidget {
  const InnerTransactionConfirmation({super.key, this.innerBank});

  final bool? innerBank;

  @override
  State<InnerTransactionConfirmation> createState() =>
      _InnerTransactionConfirmationState();
}

class _InnerTransactionConfirmationState
    extends State<InnerTransactionConfirmation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 90.h),
            physics: const BouncingScrollPhysics(),
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.stB + 18.h),
              TopBar(
                actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,
              ),
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
                          "Do You want to save it?",
                          style: themeData.textTheme.bodyLarge
                              ?.copyWith(fontSize: 16),
                        ),
                        AppText(
                          'You can save your data for next time ',
                          style: themeData.textTheme.bodySmall
                              ?.copyWith(fontSize: 12.fS),
                        ),
                      ],
                    ).pad(EdgeInsets.only(left: 20.rSA)),
                    const Spacer(),
                    Switch(
                            value: false,

                            //activeTrackColor: Colors.black,
                            inactiveTrackColor:
                                themeData.colorScheme.tertiary.withOpacity(0.5),
                            trackOutlineColor:
                                MaterialStateProperty.all(Colors.transparent),
                            thumbColor: MaterialStateProperty.all(
                                const Color(0xff535353)),
                            onChanged: (val) {})
                        .withMargin(const EdgeInsets.only(right: 20))
                  ],
                ),
              ),
              20.y,
              AppText(
                widget.innerBank == true ? "From Account" : 'Account',
                style: themeData.textTheme.bodyMedium,
              ),
              const CommonInnerTransWidget(
                firstStr: 'Account type',
                fistVal: 'current account',
                secondStr: 'Account number',
                secondVal: '',
                thirdStr: "Last name",
                thirdVal: "Mohammed",
                fourthStr: "Available balance",
                fourthVal: "",
              ),
              10.y,
              AppText(
                widget.innerBank == true
                    ? " To Beneficiary communication"
                    : 'Beneficiary communication',
                style: themeData.textTheme.bodyMedium,
              ),
              const CommonInnerTransWidget(
                firstStr: 'Recipient name',
                fistVal: '',
                secondStr: 'Amount',
                secondVal: '',
                thirdStr: "Date of transfer",
                thirdVal: "",
                fourthStr: "Repeat",
                fourthVal: "none",
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
                  //context.to(InnerTransactionConfirmation());
                  if (widget.innerBank != null) {
                    context.to(VerifyOtp());
                  } else {
                    CommonDialogs.showSuccessDialogue(
                        context: context, title: "successful Transaction");
                  }
                },
              ))
        ],
      ),
    );
  }
}

class CommonInnerTransWidget extends StatelessWidget {
  const CommonInnerTransWidget(
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
    return Chip(
      label: Column(
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
          ),
          InnerRow(
            firstStr: fourthStr,
            firstVal: fourthVal,
          ),
        ],
      ).padHorizontal(20).pad(const EdgeInsets.only(top: 20)),
    );
  }
}

class InnerRow extends StatelessWidget {
  const InnerRow({super.key, this.firstStr, this.firstVal});
  final String? firstStr;
  final String? firstVal;
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
        style: themeData.textTheme.bodySmall?.copyWith(fontSize: 13),
      )
    ]).withMargin(EdgeInsets.only(bottom: 20.rSA));
  }
}
