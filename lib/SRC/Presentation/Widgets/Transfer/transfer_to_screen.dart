import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transfer/Component/InnerTransaction/inner_transaction.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transfer/Component/InsideBank/inside_bank.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transfer/Component/ModelManagement/model_management.dart';

class TransferToScreen extends StatefulWidget {
  const TransferToScreen({super.key});

  @override
  State<TransferToScreen> createState() => _TransferToScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _TransferToScreenState extends State<TransferToScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.stB + 18.h),
          TopBar(
            actionIcon: Assets.icons.sortIcon,
            scaffoldKey: _scaffoldKey,
          ),
          30.y,
          AppText(
            'Transfer to',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 22,
            ),
          ),
          AppText(
            'Choose of the following',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 14),
          ),
          30.y,

          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ArrowButton(
                  iconPath: index == 0
                      ? Assets.icons.userIcon
                      : index == 1
                          ? Assets.icons.flagLight
                          : Assets.icons.deskIcon,
                  title: index == 0
                      ? 'Inner transaction'
                      : index == 1
                          ? "Inside the bank"
                          : "Model management",
                  leadingColor: index == 0
                      ? theme.colorScheme.primary
                      : index == 1
                          ? Colors.black
                          : const Color(0xffB11811),
                  fromTransfer: true,
                  subTitle: index == 0
                      ? null
                      : index == 1
                          ? 'Transfer money to up to 3 beneficiaries'
                          : "Download the previous transfers form",
                  iconColor: Colors.white,
                ).onTapped(onTap: () {
                  _onTransferRowTapped(index);
                });
              },
              separatorBuilder: (context, index) {
                return 10.y;
              },
              itemCount: 3)
          // ArrowButton(iconPath: iconPath, title: title)
          //add description and adjust it properly @farooq
        ],
      ).padHorizontal(24),
    );
  }

  void _onTransferRowTapped(int index) {
    if (index == 0) {
      context.to(const InnerTransaction());
    } else if (index == 1) {
      context.to(const InsideBankTransaction());
    } else {
      context.to(const ModelManagement());
    }
  }
}
