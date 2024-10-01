
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CustomBottomSheet {
  showBottomSheet(BuildContext context, Widget child,{bool? isScroll}) {
    return showModalBottomSheet(
        isScrollControlled: isScroll??true,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        context: context,
        builder: (BuildContext context) {
          return child;
        });
  }

  void showDraggableSheet(BuildContext context, Widget child,{bool? isScroll,double? initialChildSIze,double? minChildSize,double? maxChildSIze}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: isScroll??true, // Important for DraggableScrollableSheet
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: initialChildSIze??0.4, // Adjust initial sheet height
        minChildSize:minChildSize?? 0.2,
        expand: false,
        snap: true,// Set minimum sheet height
        maxChildSize: maxChildSIze??0.7 ,// Allow full screen expansion
        builder: (context, controller) => Container(
          // Your bottom sheet content here
          child: child!
        ),
      ),
    );
  }



}
