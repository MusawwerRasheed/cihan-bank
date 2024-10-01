import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class PauseCheckTab extends StatelessWidget {
  const PauseCheckTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: AppTextField(
            controller: TextEditingController(),
            textInputType: TextInputType.datetime,
            hintText: 'From Check',
          ),
        ),
        8.y,
        SizedBox(
          child: AppTextField(
            controller: TextEditingController(),
            textInputType: TextInputType.datetime,
            hintText: 'To',
          ),
        )
      ],
    );
  }
}
