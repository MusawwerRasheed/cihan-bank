import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AppFrame extends StatefulWidget {
  const AppFrame({super.key});

  @override
  State<AppFrame> createState() => _AppFrameState();
}

class _AppFrameState extends State<AppFrame> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    print(1.btB);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
         drawer: AppDrawer(scaffoldKey: scaffoldKey),
        body: HomeMasterScreen(
          scaffoldKey: scaffoldKey,
        ));
  }
}
