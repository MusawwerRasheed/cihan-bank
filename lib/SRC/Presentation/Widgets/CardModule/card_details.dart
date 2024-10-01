import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/Components/top_back_widget.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}
final GlobalKey<ScaffoldState> _scaffoldKeyB = GlobalKey<ScaffoldState>();

class _CardDetailsState extends State<CardDetails> {
  late ThemeData themeData;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    themeData=Theme.of(context);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        key: _scaffoldKeyB,
        resizeToAvoidBottomInset: false,
        drawer: AppDrawer(scaffoldKey: _scaffoldKeyB),
    body: BackRedWidget(scaffoldKey: _scaffoldKeyB, child:
    Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.white,
          height: 0.79.sh,
        child:  ListView(
          padding: const EdgeInsets.only(top: 90),
          children: [

          AppText("Activities Overview",style: themeData.textTheme.bodyMedium,),
            3.y,
            AppText('Your account activites',style: themeData.textTheme.bodySmall?.copyWith(color: themeData.colorScheme.tertiary),),

            5.y,
            Row(children: [

              Container(
                width: 171.11.h,
                height: 97.22,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.67),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F807E8C),
                      blurRadius: 16.33,
                      offset: Offset(0, 3.89),
                      spreadRadius: 0,
                    )
                  ],

                ),
                child: Column(
                  
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    AppText('Weekly Activity',style: themeData.textTheme.bodyMedium?.copyWith(fontSize: 12),),
                    AppText('+10% Daily Cash Increases',style: themeData.textTheme.bodySmall?.copyWith(color: themeData.colorScheme.tertiary,fontSize: 10),),

                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context,inde){
                          return 15.x;
                        },
                        itemBuilder: (context,index) {
                          return ShaderMask(  blendMode: BlendMode.srcOver,

                            shaderCallback: (Rect bounds) {
                             // print(animatedWidth);
                              return LinearGradient(
                                end: Alignment.topCenter,

                                colors:  [

                                  // This is the color that appears as the button is held down.

                                  themeData.primaryColor
                                  , const Color(0xFFEFEFEF),
                                  //const Color(0xFFEFEFEF),

                                  // This color is transparent, which means it doesn't show up on the screen.
                                  // The gradient transitions from the fill color to transparent as the button is held down.
                                  // This gives the effect of the button filling up with color the longer it's held.
                                 // themeData.primaryColor
                                ],
                                // The stops property defines where each color is placed along the line.
                                // Here we're using the same value for both stops, which creates a sharp transition at that point.
                                stops:  [
                                  index==0? 0 :index==1?0.3:index==2?0.4 :index==3?1: 0,
                                  index==3?1:0,
                               //   1

                                ],
                              ).createShader(bounds);

                            },

                          child: Container(
                            width: 10,
                            height: 36.94,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFEFEFEF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.44),
                              ),
                            ),
                          ),
                          );
                        }, itemCount: 15,
                      ),
                    )
                    
                  ],
                  
                ),
              ),
              10.x,
              Container(
                width: 171.11.h,
                height: 97.22,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.67),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F807E8C),
                      blurRadius: 16.33,
                      offset: Offset(0, 3.89),
                      spreadRadius: 0,
                    )
                  ],
                ),

                child: Column(

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    20.y,

                    AppText('Account Balance',style: themeData.textTheme.bodyMedium?.copyWith(fontSize: 12),),
5.y,

                    Row(
                      children: [
                      10.x,
                        AppText('39,744.65',style: themeData.textTheme.bodyMedium?.copyWith(color: themeData.colorScheme.onPrimaryContainer,fontSize: 21),),
                      5.x,
                      AppText("IQD",style:themeData.textTheme.bodyMedium?.copyWith(color:  themeData.colorScheme.onPrimaryContainer,fontSize: 10), )
                      ],
                    ),



                  ],

                ),
              )

            ],)

        ],).padHorizontal(22),

        )
    ).stackIt([
      Positioned(
        //bottom: 0,
          left: 50,
          top: 100.h,
          right: 50,
          child: Align(
            child: Container(
              width: 286,
              height: 177,
              decoration: ShapeDecoration(
               // color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F807E8C),
                    blurRadius: 16.80,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Image.asset(
                "assets/images/card1.png",
                fit: BoxFit.contain,
              ),
            ),
          ))
    ]),
    )

    );
  }
}
