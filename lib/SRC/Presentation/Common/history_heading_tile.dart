import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:intl/intl.dart';

class HistoryHeadingTile extends StatefulWidget {
  String title;
  String? subTitle;
  HistoryHeadingTile({
    this.subTitle,
    required this.title,
    super.key,
  });

  @override
  State<HistoryHeadingTile> createState() => _HistoryHeadingTileState();
}

class _HistoryHeadingTileState extends State<HistoryHeadingTile> {
  late List<String> _dateList;
  late String _selectedDate;

  @override
  void initState() {
    super.initState();
    _dateList = _generateDateList();
    _selectedDate = _dateList.first;
  }

  List<String> _generateDateList() {
    List<String> dates = [];
    DateTime currentDate = DateTime.now();
    DateFormat dateFormat = DateFormat('MMM dd, yyyy');
    for (int i = 0; i < 10; i++) {
      dates.add(dateFormat.format(currentDate.add(Duration(days: i))));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              widget.title,
              style: themeData.textTheme.bodyLarge!.copyWith(
                  fontSize: 20.rSA,
                  color: themeData.colorScheme.onPrimaryFixed),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                elevation: 0,
                value: _selectedDate,
                items: _dateList.map((date) {
                  return DropdownMenuItem(
                    alignment: Alignment.center,
                    value: date,
                    child: Text(
                      date,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  );
                }).toList(),
                selectedItemBuilder: (BuildContext context) {
                  return _dateList.map((date) {
                    return Text(
                      "Date",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ).pad(
                      EdgeInsets.only(
                        top: 11.fS,
                        left: 80.fS,
                      ),
                    );
                  }).toList();
                },
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDate = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
        AppText(
          widget.subTitle!,
          style: themeData.textTheme.bodySmall!
              .copyWith(color: themeData.colorScheme.tertiary),
        ),
      ],
    );
  }
}
