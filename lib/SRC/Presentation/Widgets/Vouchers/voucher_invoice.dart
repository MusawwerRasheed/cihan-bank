import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transfer/Component/InnerTransaction/confirmationinnertrans.dart';

class VoucherInvoice extends StatefulWidget {
  const VoucherInvoice({super.key, this.innerBank});

  final bool? innerBank;

  @override
  State<VoucherInvoice> createState() => _VoucherInvoiceState();
}

class _VoucherInvoiceState extends State<VoucherInvoice> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 90.h),
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 1.stB + 18.h),
              TopBar(
                actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,
              ),
              30.y,
              AppText(
                'Voucher Invoice',
                style: themeData.textTheme.bodyLarge,
              ),
              11.y,
              const CommonInnerTransWidget(
                firstStr: 'Account number',
                fistVal: '969868',
                secondStr: 'Reference number',
                secondVal: '00.00 1234567890',
                thirdStr: "Voucher name",
                thirdVal: "itunes",
                fourthStr: "Voucher code",
                fourthVal: "0n9xdu",
              ),
              20.y,
              CommonTransWidget(
                firstStr: 'Voucher Price',
                fistVal: '00.97 USD',
                secondStr: 'Payment fees',
                secondVal: '00.00 USD',
                thirdStr: "Total",
                thirdVal: "00.97 USD",
                fourthStr: "Exchange amount rate",
                fourthVal: "00.00IQD",
                fifthStr: "Exchange amount",
                fifthVal: "132.0",
                sixthStr: "Date",
                sixthVal: "2023-07-09",
              ),
            ],
          ).padHorizontal(24),
        ],
      ),
    );
  }
}

class CommonTransWidget extends StatelessWidget {
  CommonTransWidget(
      {super.key,
      this.firstStr,
      this.fistVal,
      this.secondStr,
      this.secondVal,
      this.thirdStr,
      this.thirdVal,
      this.fourthStr,
      this.fourthVal,
      this.fifthStr,
      this.fifthVal,
      this.sixthStr,
      this.sixthVal});

  final String? firstStr;
  final String? fistVal;
  final String? secondStr;
  final String? secondVal;
  final String? thirdStr;
  final String? thirdVal;
  final String? fourthStr;
  final String? fourthVal;
  final String? fifthStr;
  final String? fifthVal;
  final String? sixthStr;
  final String? sixthVal;

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
          InnerRow(
            firstStr: fifthStr,
            firstVal: fifthVal,
          ),
          InnerRow(
            firstStr: sixthStr,
            firstVal: sixthVal,
          ),
        ],
      ).padHorizontal(20).pad(const EdgeInsets.only(top: 20)),
    );
  }
}
