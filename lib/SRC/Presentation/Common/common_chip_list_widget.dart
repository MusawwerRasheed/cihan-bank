import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CommonChipListWidget extends StatelessWidget {
  const CommonChipListWidget(
      {super.key,
      required this.dataList,
      required this.onSelect,
      this.activeIndex,
      this.title,
      this.titleStyle,
      this.spaceBetween});

  final List<String> dataList;
  final Function(int i) onSelect;
  final int? activeIndex;
  final String? title;
  final TextStyle? titleStyle;
  final int? spaceBetween;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          AppText(
              maxLine: 4,
              title!,
              style: titleStyle ??
                  theme.textTheme.bodySmall!.copyWith(fontSize: 13)),
        spaceBetween?.y ?? 4.y,
        Wrap(
          spacing: 12,
          children: dataList
              .mapIndexed(
                (index, element) => Chip(
                  backgroundColor: index == activeIndex
                      ? LightColorsPalate.blueBorderColor.withOpacity(.1)
                      : null,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: index == activeIndex
                          ? LightColorsPalate.blueBorderColor
                          : theme.colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(
                      34,
                    ),
                  ),
                  label: AppText(
                    element,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 11,
                    ),
                  ).padHorizontal(10),
                ).onTapped(onTap: () {
                  onSelect(index);
                }),
              )
              .toList(),
        )
      ],
    );
  }
}
