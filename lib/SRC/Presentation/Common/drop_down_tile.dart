import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';

class DropDownSearchTile extends StatelessWidget {
  const DropDownSearchTile({
    super.key,
    required this.val,
  });

  final String val;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outline, width: 1),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppText(
          val,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 12,
          ),
        ),
      ),
    ).padHorizontal(20);
  }
}
