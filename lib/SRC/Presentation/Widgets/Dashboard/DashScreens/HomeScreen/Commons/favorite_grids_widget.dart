import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class FavouritesGridsWidget extends StatelessWidget {
  const FavouritesGridsWidget(
      {super.key, required this.isExpanded, required this.index});

  final List<bool> isExpanded;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isExpanded[index] ? 260 : 0,
      child: isExpanded[index]
          ? FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 200)),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.done
                      ? HomeGrids(
                          isExpanded: isExpanded,
                          index: index,
                        )
                      : const Center(),
            )
          : null,
    );
  }
}
