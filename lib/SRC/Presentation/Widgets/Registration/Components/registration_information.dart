import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class RegistrationInformation extends StatefulWidget {
  const RegistrationInformation(
      {super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<RegistrationInformation> createState() =>
      _RegistrationInformationState();
}

class _RegistrationInformationState extends State<RegistrationInformation> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      children: [
        Center(
          child: AppText(
            'Checking Point',
            style: theme.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        4.y,
        Center(
          child: AppText(
            'Registration information',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.2,
          centerTitle: '2/9',
        ).padHorizontal(30),
        40.y,
        AppTextField(
          hintText: 'Nationality',
          controller: TextEditingController(),
          textInputType: TextInputType.text,
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppText('🇮🇶'),
              4.x,
              const Icon(Icons.keyboard_arrow_down, size: 12),
              4.x,
            ],
          ),
        ).padHorizontal(24),
        30.y,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonChipListWidget(
                dataList: const ['No', 'Yes'],
                onSelect: (v) {
                  widget.registrationController.liveInIraq = v;
                  setState(() {});
                },
                activeIndex: widget.registrationController.liveInIraq,
                title: 'Do you live in Iraq?'),
            30.y,
            CommonChipListWidget(
                dataList: const ['No', 'Yes'],
                onSelect: (v) {
                  widget.registrationController.firstDegreeRelatives = v;
                  setState(() {});
                },
                activeIndex: widget.registrationController.firstDegreeRelatives,
                title:
                    'Do you or any of your first-degree relatives ever hold or still hold political office?'),
            30.y,
            CommonChipListWidget(
                dataList: const ['No', 'Yes'],
                onSelect: (v) {
                  widget.registrationController.areYouUsingAccount = v;
                  setState(() {});
                },
                activeIndex: widget.registrationController.areYouUsingAccount,
                title: 'Are you the one who will use the account?'),
            30.y,
            CommonChipListWidget(
                dataList: const ['No', 'Yes'],
                onSelect: (v) {
                  widget.registrationController.usCitizen = v;
                  setState(() {});
                },
                activeIndex: widget.registrationController.usCitizen,
                title:
                    'Are you a US citizen, passport holder, green card holder, US resident, or US taxpayer?'),
            30.y,
            CommonChipListWidget(
                dataList: const ['No', 'Yes'],
                onSelect: (v) {
                  widget.registrationController.sector = v;
                  setState(() {});
                },
                activeIndex: widget.registrationController.sector,
                title: 'Sector'),
          ],
        ).padHorizontal(24)
      ],
    );
  }
}
