import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppCalender extends StatefulWidget {
  const AppCalender({
    Key? key,
  }) : super(key: key);
  @override
  State<AppCalender> createState() => _AppCalenderState();
}
class _AppCalenderState extends State<AppCalender> {
  DateTime? _startDate;
  DateTime? _endDate;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate = args.value.startDate;
      _endDate = args.value.endDate;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Card(
        elevation: 0.9,
        child: SfDateRangePicker(
          monthFormat: "EEE",
          monthViewSettings: const DateRangePickerMonthViewSettings(
            dayFormat: "EEE",
            viewHeaderStyle: DateRangePickerViewHeaderStyle(),
          ),
          onSelectionChanged: _onSelectionChanged,
          backgroundColor: Colors.white,
          toggleDaySelection: true,
          showNavigationArrow: true,
          headerStyle: const DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            backgroundColor: Colors.white,
          ),
          selectionMode: DateRangePickerSelectionMode.range,
          initialSelectedDate: DateTime.now(),
        ),
      ),
    );
  }
}