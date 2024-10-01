import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class BanksList extends StatefulWidget {
  const BanksList({super.key});

  @override
  State<BanksList> createState() => _BanksListState();
}

class _BanksListState extends State<BanksList> {
  int selectedIndex=0;

  final List<String> banksList=["Bank of baghdad","Gulf Commercial Bank","Dar Es Salaam Investment Bank","Ashur International Bank",
  "Ajman Bank",
    "Babylon Bank","Rasheed Bank","Mosul Bank for Develop","Agricultural Cooperative Ba"
  ];
  @override
  Widget build(BuildContext context) {
    final themeData= Theme.of(context);
    return Scaffold(

      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         AppText("Select Option",style:themeData.textTheme.bodyLarge,),

          Expanded(child: ListView.separated(itemBuilder: (context,index){
            return BankTile(isSelected:selectedIndex==index,
                bankName: banksList[index],
                onSelect:(val){
              print(val);
              setState(() {
                selectedIndex=val;
              });
            }, index: index,

            );



          }, separatorBuilder: (context,ind){

            return  10.y;
          }, itemCount: banksList.length))
        ],
      ).padHorizontal(24),

          appBar: AppBar(leading:   Transform.translate(
            offset: const Offset(15,0),
            child: DynamicAppIconHandler.buildIcon(
              context: context,
              svg: Assets.icons.backArrowIcon,
            ).onTapped(onTap: () {
              Navigator.of(context).pop();
            }),
          ),
          automaticallyImplyLeading: false,
          leadingWidth: 35,
          ),



    );
  }
}

class BankTile extends StatelessWidget {
  const BankTile({super.key, this.isSelected, this.onSelect, this.bankName, required this.index});
final bool? isSelected;
final  void Function(int val)? onSelect;
final int index;
final String? bankName;
  @override
  Widget build(BuildContext context) {
    print(isSelected);
    return ListTile(minTileHeight: 60,
    onTap: (){

      if(isSelected!= true) {
        onSelect!(index);
      }

    },
      tileColor: isSelected==true?const Color(0xFFF6F6F6):null,

    shape: RoundedRectangleBorder(side: const BorderSide(width: 1, color: Color(0xFFE0E0E0)),
      borderRadius: BorderRadius.circular(17),),
    title: AppText(bankName??"",style: Theme.of(context).textTheme.bodyMedium,),
      trailing: isSelected==true?Container(
        width: 16,
        height: 16,
        decoration: const ShapeDecoration(
          color: Color(0xFFB11811),
          shape: OvalBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFE0E0E0),
            ),
          ),
        ),
      ):Container(
        width: 16,
        height: 16,
        decoration: const ShapeDecoration(
          shape: OvalBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFE0E0E0),
            ),
          ),
        ),
      ).onTapped(onTap: (){
        onSelect!(index);
      }),
    );
  }
}

