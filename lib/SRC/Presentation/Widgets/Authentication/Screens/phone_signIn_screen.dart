import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class PhoneSignInScreen extends StatefulWidget {
  const PhoneSignInScreen({super.key});

  @override
  State<PhoneSignInScreen> createState() => _PhoneSignInScreenState();
}

class _PhoneSignInScreenState extends State<PhoneSignInScreen> {
  final List<String> _suggestions = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
  ];

  List<String> _suggestionsCallback(String query) {
    return _suggestions
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController privateController = TextEditingController();
  TextEditingController addAnswerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 1.stB + 18),
              const TopBar(),
              Center(
                child: AssetImageWidget(
                  url: Assets.images.logoImg.path,
                  width: 0.5.sw,
                  fit: BoxFit.scaleDown,
                ),
              ),
              39.y,
              AppText(
                "Sign-In",
                style: themeData.textTheme.headlineMedium,
              ),
              34.y,
              AppTextField(
                  textInputType: TextInputType.text,
                  controller: nameController,
                  hintText: "Name"),
              12.y,
              AppTextField(
                  textInputType: TextInputType.number,
                  controller: numberController,
                  hintText: "+964 00 000 0000"),
              20.y,
              const Divider(),
              36.y,
              CommonDropDown(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: themeData.colorScheme.tertiaryContainer,
                ),
                hintText: "Select your private question",
                suggestionsCallback: _suggestionsCallback,
                itemBuilder: (BuildContext context, String suggestion) {
                  return ListTile(
                    title: Text(
                      suggestion,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  );
                },
                onSuggestionSelected: (String suggestion) {
                  privateController.text = suggestion;
                },
                controller: privateController,
              ),
              14.y,
              AppTextField(
                  textInputType: TextInputType.text,
                  controller: addAnswerController,
                  hintText: "Add answer "),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonButton(
        onTap: () {
          context.to(const OtpScreen());
        },
        text: "Request",
        verticalMargin: 16,
        horizontalMargin: 34,
      ),
    );
  }
}
