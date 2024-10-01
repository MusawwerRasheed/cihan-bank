import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class TileButton extends StatelessWidget {
  TileButton({
    super.key,
    required this.leading,
    required this.title,
    this.color,
    required this.subtitle,
    required this.trailing,
  });

  final Widget leading;
  final String title;
  Color? color;
  final String subtitle;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: theme.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onBackground.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? theme.colorScheme.error,
            ),
            child: leading,
          ),
          10.x,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                  ),
                ),
                AppText(
                  subtitle,
                  style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: 10, color: theme.colorScheme.tertiary),
                ),
              ],
            ),
          ),
          trailing,
          10.x,
        ],
      ),
    );
  }
}
