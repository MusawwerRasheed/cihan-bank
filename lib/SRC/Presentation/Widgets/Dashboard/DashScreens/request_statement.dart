import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/credit_card.dart';

class RequestStatement extends StatefulWidget {
  const RequestStatement({super.key});

  @override
  State<RequestStatement> createState() => _RequestStatementState();
}

class _RequestStatementState extends State<RequestStatement> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.y,
            TopBar().padHorizontal(29),
            25.y,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Request Statement",
                  style: themeData.textTheme.bodyLarge!
                      .copyWith(color: themeData.colorScheme.onPrimaryFixed),
                ),
                20.y,
                CreditCard(
                  cardHolderName: 'Noman Manzoor',
                  cardNumber: '**** **** **** 2345',
                  expiryDate: '02/30',
                  gred1Color: LightColorsPalate.gred2Color,
                  gred2Color: LightColorsPalate.gred2Color,
                  circleColor: LightColorsPalate.gred3Color,
                ),
                23.y,
                SwitchContainer(
                    isSwitched: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    subTitle: 'Do you want to send a formal request statement?',
                    title: 'Zafar'),
                19.y,
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: _startDateController,
                        textInputType: TextInputType.datetime,
                        hintText: 'Start Date',
                        suffixIcon: AssetImageWidget(
                          url: Assets.icons.calenderIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: AppTextField(
                        controller: _endDateController,
                        textInputType: TextInputType.datetime,
                        hintText: 'End Date',
                        suffixIcon: AssetImageWidget(
                          url: Assets.icons.calenderIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).padHorizontal(27),
          ],
        ),
      ),
      bottomNavigationBar: CommonButton(
        onTap: () {
          _handleRequest();
        },
        text: 'Request',
        verticalMargin: 20,
        horizontalMargin: 24,
      ),
    );
  }

  void _handleRequest() {
    if (_startDateController.text.isEmpty || _endDateController.text.isEmpty) {
      CommonDialogs.showErrorDialogue(
          context: context, title: "Something went wrong please try again  ");
    } else {
      CommonDialogs.showSuccessDialogue(
          context: context, title: "successful request");
    }
  }
}
