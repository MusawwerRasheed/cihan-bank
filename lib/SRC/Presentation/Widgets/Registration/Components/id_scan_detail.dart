import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Colors/lightcolorpallete.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_icon_handler.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/custom_percent_indicator.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Controller/registration_controller.dart';
import 'package:cihan_bank_mobile_banking/gen/assets.gen.dart';

class IdScanDetail extends StatefulWidget {
  const IdScanDetail({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<IdScanDetail> createState() => _IdScanDetailState();
}

class _IdScanDetailState extends State<IdScanDetail> {
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
          child: AppText('ID Scan Detail',
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: theme.colorScheme.tertiary,
              )),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.4,
          centerTitle: '4/9',
        ).padHorizontal(30),
        40.y,
        LargeCardWidget(
          title: 'ID Photo',
          svgPath: Assets.icons.identiCardIcon,
          isSelected: widget.registrationController.idPhoto,
        ).onTapped(onTap: () {
          widget.registrationController.idPhoto =
              !widget.registrationController.idPhoto;
          setState(() {});
        }),
        20.y,
        LargeCardWidget(
          title: 'Personal Live Photo',
          svgPath: Assets.icons.identiCardIcon,
          isSelected: widget.registrationController.livePhoto,
        ).onTapped(onTap: () {
          widget.registrationController.livePhoto =
              !widget.registrationController.livePhoto;
          setState(() {});
        })
      ],
    );
  }
}

class LargeCardWidget extends StatelessWidget {
  const LargeCardWidget({
    super.key,
    required this.title,
    required this.svgPath,
    required this.isSelected,
  });

  final String title;
  final String svgPath;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        height: 170,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: isSelected
              ? LightColorsPalate.blueBorderColor.withOpacity(0.1)
              : null,
          border: Border.all(
            color: isSelected
                ? LightColorsPalate.blueBorderColor
                : LightColorsPalate.tertiaryColor.withOpacity(0.5),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    isSelected ? Icons.circle : Icons.circle_outlined,
                    color: isSelected
                        ? LightColorsPalate.blueBorderColor
                        : LightColorsPalate.tertiaryColor.withOpacity(0.5),
                    size: 30,
                  )).padHorizontal(20),
              Container(
                height: 50,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: theme.colorScheme.error,
                ),
                child: DynamicAppIconHandler.buildIcon(
                  context: context,
                  svg: svgPath,
                ),
              ),
              4.y,
              AppText(
                title,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 17,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              30.y,
            ],
          ),
        ),
      ),
    );
  }
}
