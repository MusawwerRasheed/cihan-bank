import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/hostory_benficery_model.dart';

class HistoryTileBenficiary extends StatelessWidget {
  const HistoryTileBenficiary({super.key, this.dto});
  final HistoryBenModel? dto;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 54,

      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(71),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x66A7A7A7),
            blurRadius: 3.10,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],


      ),
      child: Row(children: [
        11.x,
        Container(
          width: 43,
          height: 43,

          decoration: BoxDecoration(shape: BoxShape.circle,color: dto!.backGroundColor!),


          child: Center(child: DynamicAppIconHandler.buildIcon(context: context,svg: dto!.iconPath??""),),
          
        ),
        10.x,
        Expanded(child: AppText(dto!.description,style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),maxLine: 3,)),
        Column(
          mainAxisSize: MainAxisSize.min,

          children: [
          10.y,
          AppText(dto!.quantity.toString(),style: Theme.of(context).textTheme.bodyMedium,),
          AppText(dto!.time!,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.tertiary,fontSize: 8),)

        ],),
        10.x


      ],),
    );
  }
}