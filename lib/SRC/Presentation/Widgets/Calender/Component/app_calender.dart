import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppCalender extends StatefulWidget {
  const AppCalender({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<AppCalender> createState() => _AppCalenderState();
}

class _AppCalenderState extends State<AppCalender> {
  DateTime? _selectedDate;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _selectedDate = args.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.9,
      child: SfDateRangePicker(
        monthFormat: "EEE",
        monthViewSettings: const DateRangePickerMonthViewSettings(
            dayFormat: "EEE",
            viewHeaderStyle: DateRangePickerViewHeaderStyle()),
        onSelectionChanged: _onSelectionChanged,
        backgroundColor: LightColorsPalate.backgroundColor,
        toggleDaySelection: true,
        showNavigationArrow: true,
        headerStyle: DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: widget.theme.textTheme.bodySmall!
                .copyWith(color: widget.theme.colorScheme.primary),
            backgroundColor: LightColorsPalate.backgroundColor),
        selectionMode: DateRangePickerSelectionMode.single,
        initialSelectedDate: DateTime.now(),
      ),
    );
  }
}
