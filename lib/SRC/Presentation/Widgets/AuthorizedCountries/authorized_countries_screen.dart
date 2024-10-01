import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AuthorizedCountriesScreen extends StatefulWidget {
  const AuthorizedCountriesScreen({super.key});

  @override
  State<AuthorizedCountriesScreen> createState() =>
      _AuthorizedCountriesScreenState();
}

class _AuthorizedCountriesScreenState extends State<AuthorizedCountriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      key: _scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(
            horizontalPad: 24,
            scaffoldKey: _scaffoldKey,
            actionIcon: Assets.icons.sortIcon,
          ),
          30.y,
          AppText(
            'Authorized Countries',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 22.fS,
            ),
          ).padHorizontal(24),
          AppText(
            'You can more country’s',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 14.fS),
          ).padHorizontal(24),
          30.y,
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  height: 160.h,
                  width: 240.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(color: theme.colorScheme.outline),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      6.y,
                      AssetImageWidget(url: Assets.images.iraqImg.path),
                      6.y,
                      AppText(
                        'Iraq',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontSize: 16.fS),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => 10.y,
            itemCount: 3,
          ))
        ],
      ),
      bottomNavigationBar: CommonButton(
        horizontalMargin: 24,
        backgroundColor: theme.colorScheme.onBackground,
        verticalMargin: 16,
        onTap: () {},
        text: 'Add new Country',
        leadingIconMargins: EdgeInsets.symmetric(horizontal: 12),
        leadingIcon: Icons.add_circle_outline,
        leadingColor: theme.colorScheme.background,
      ),
    );
  }
}
