import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Colors/lightcolorpallete.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_icon_handler.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/common_text_field.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/custom_percent_indicator.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/common_dropdown.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/drop_down_tile.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Controller/registration_controller.dart';
import 'package:cihan_bank_mobile_banking/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key, required this.registrationController});
  final RegistrationController registrationController;
  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dummyStringList = List.generate(10, (index) => "Option $index");

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            DynamicAppIconHandler.buildIcon(context: context,svg: Assets.icons.homeAddressIcon),
            4.x,
            Center(
              child: AppText(
                'Home Address',
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        4.y,
        Center(
          child: AppText(
            'Home Details',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        20.y,
        const CustomPercentIndicator(
          val: 0.6,
          centerTitle: '6/9',
        ).padHorizontal(30),
        40.y,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonDropDown(
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: theme.colorScheme.onBackground,
              ),
              hintText: 'City',
              suggestionsCallback: (str) {
                return _searchInList(dummyStringList, str);
              },
              itemBuilder: (context, v) {
                return DropDownSearchTile(val: v);
              },
              onSuggestionSelected: (v) {},
              controller: TextEditingController(),
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'Location',
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'Neighborhood',
            ),
            20.y,
            AppTextField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: 'Accommodation type',
            ),
            20.y,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: TextEditingController(),
                    textInputType: TextInputType.text,
                    hintText: 'Street',
                  ),
                ),
                20.x,
                Expanded(
                  child: AppTextField(
                    controller: TextEditingController(),
                    textInputType: TextInputType.text,
                    hintText: 'Home',
                  ),
                ),
              ],
            ),
            20.y,
            AppText(
              '*Use location on map',
              style: theme.textTheme.titleSmall!.copyWith(
                color: LightColorsPalate.blueBorderColor,
              ),
            ),
            10.y,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                  color: LightColorsPalate.blueBorderColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DynamicAppIconHandler.buildIcon(
                    iconHeight: 20,
                    context: context,
                    svg: Assets.icons.mapIcon,
                    iconColor: LightColorsPalate.blueBorderColor,
                  ),
                  6.x,
                  AppText(
                    'Map',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: LightColorsPalate.blueBorderColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ).padHorizontal(24),
      ],
    );
  }

  List<String> _searchInList(List<String> dummyStringList, String str) {
    return dummyStringList
        .where((element) => element.toLowerCase().contains(str.toLowerCase()))
        .toList();
  }
}
