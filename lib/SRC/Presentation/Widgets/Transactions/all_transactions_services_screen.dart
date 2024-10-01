import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transactions/Components/all_transfer_services_content.dart';

class AllTransferServicesScreen extends StatefulWidget {
  const AllTransferServicesScreen({super.key});

  @override
  State<AllTransferServicesScreen> createState() =>
      _AllTransferServicesScreenState();
}

class _AllTransferServicesScreenState extends State<AllTransferServicesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
        body: Expanded(
          child: Column(
            children: [
              TopBar(
                actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,
              ).pad(const EdgeInsets.only(top: 40, left: 10, right: 10)),
              AllTransferServicesContent(
                  containerHeight: 650,
                  buttonText: 'Transfer',
                  topPadding: 200,
                  dockVisibility: false,
                  themeData: themeData,
                  allTransferServices: Util.allTransferServices,
                  allTransferServicesTexts: Util.allTransferServicesTexts),
            ],
          ),
        ),
        key: _scaffoldKey,
        drawer: AppDrawer(scaffoldKey: _scaffoldKey));
  }
}
