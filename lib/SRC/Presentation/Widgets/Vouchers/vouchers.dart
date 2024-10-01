import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Vouchers/voucher_list_screen.dart';

class Vouchers extends StatefulWidget {
  const Vouchers({super.key});

  @override
  State<Vouchers> createState() => _VouchersState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _VouchersState extends State<Vouchers> {
  @override
  Widget build(BuildContext context) {
    final List<Map> ls = [
      {'Xbox': Assets.images.xboxImg.path},
      {'Itunes': Assets.images.itunes.path},
      {'Playstation': Assets.images.playstationImg.path},
      {'Nintendo': Assets.images.nintedoImg.path},
      {'Steam': Assets.images.streamImg.path},
      {'Playstore': Assets.images.playStoreImg.path},
      {'Ebay': Assets.images.ebayImg.path},
      {'Amazon': Assets.images.amazonImg.path},
      {'Gaming cards': Assets.images.gameOnImg.path},
    ];
    final List<Map> name = [
      {'Xbox': "XBox"},
      {'Itunes': "Itunes"},
      {'Playstation': "Playstation"},
      {'Nintendo': "Nintendo"},
      {'Steam': "Steam"},
      {'GooglePlaystore"': "GooglePlaystore"},
      {'Ebay': "Ebay"},
      {'Amazon': "Amazon"},
      {'Gaming cards': "Gaming cards"},
    ];
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: AppDrawer(scaffoldKey: _scaffoldKey),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              18.y,
              TopBar(
                horizontalPad: 24,
                actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,
              ),
              20.y,
              AppText(
                'Vouchers',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 22.fS,
                ),
              ).padHorizontal(24.rSA),
              AppText(
                'You can choose a voucher or search for one ',
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 14.fS,
                ),
              ).padHorizontal(24.rSA),
              20.y,
              AppTextField(
                  controller: TextEditingController(),
                  textInputType: TextInputType.text,
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.rSA),
                  hintText: 'Filter',
                  suffixIcon: AssetImageWidget(
                    url: Assets.icons.searchIcon,
                    fit: BoxFit.scaleDown,
                  )).padHorizontal(24.rSA),
              Expanded(
                  child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 183,
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ls[index].values.firstOrNull,
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.rSA, vertical: 4.rSA),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(10.rSA),
                      ),
                      child: AppText(
                        name[index].values.firstOrNull,
                      ),
                    ).padAll(10.rSA),
                  ).onTapped(onTap: () {
                    context.to(const VoucherListScreen());
                  });
                },
                itemCount: ls.length,
              ))
            ],
          )),
    );
  }
}
