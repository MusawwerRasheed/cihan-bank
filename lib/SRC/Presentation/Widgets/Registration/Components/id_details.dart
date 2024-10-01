import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class IdsDetail extends StatefulWidget {
  const IdsDetail({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<IdsDetail> createState() => _IdsDetailState();
}

class _IdsDetailState extends State<IdsDetail> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            DynamicAppIconHandler.buildIcon(context: context,svg: Assets.icons.checkingPoint),
            4.x,
            Center(
              child: AppText(
                'Checking Point',
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        4.y,
        Center(
          child: AppText(
            'ID Scan Details ',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.3,
          centerTitle: '3/9',
        ).padHorizontal(30),
        40.y,
        const Column(
          children: [
            IDsPickerTile(title: 'Scan ID ( FRONT )', isPending: false),
            IDsPickerTile(title: 'Scan ID ( Back )', isPending: false),
            IDsPickerTile(title: 'Passport Scan', isPending: true),
            IDsPickerTile(title: 'Proof Of Residence ', isPending: true),
            IDsPickerTile(title: 'Living card', isPending: true),
          ],
        ).padHorizontal(24)
      ],
    );
  }
}
