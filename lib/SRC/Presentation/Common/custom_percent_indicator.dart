import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CustomPercentIndicator extends StatelessWidget {
  const CustomPercentIndicator({
    super.key,
    required this.val,
    required this.centerTitle,
  });

  final double val; //.0 to 1
  final String centerTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          Center(
            child: LinearProgressIndicator(
              color: LightColorsPalate.successColor,
              backgroundColor: theme.colorScheme.tertiary.withOpacity(0.4),
              value: val,
              minHeight: 10,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            left: (1.sw * val - (95.w * val)),
            child: Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LightColorsPalate.lightGreenColor,
              ),
              child: Center(
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: LightColorsPalate.successColor),
                  child: Center(
                    child: AppText(
                      centerTitle,
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
