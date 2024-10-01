import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/benficaryModel.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/benificaryAccountModel.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/Components/expansion_painter.dart';

class ExpansionCustom extends StatefulWidget {
  const ExpansionCustom(
      {super.key,
      this.isExpanded,
      required this.isExpansionChanged,
      this.dto,
      this.dto2});
  final bool? isExpanded;
  final Benficarymodel? dto;
  final Benificaryaccountmodel? dto2;
  final void Function(bool? val) isExpansionChanged;

  @override
  State<ExpansionCustom> createState() => _ExpansionCustomState();
}

class _ExpansionCustomState extends State<ExpansionCustom> {
  bool? isExpanded;
  double height = 77.h;
  double maxHeight = 269.h;
  @override
  void initState() {
    isExpanded = widget.isExpanded;
    height = widget.dto2 != null ? 77.h : 100.h;
    maxHeight = widget.dto2 != null ? 219.h : 269.h;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(height);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      height: height,
      child: Dismissible(
        key: UniqueKey(),
        onUpdate: (diUpd) {
          print(diUpd.direction);
        },
        background: Container(
          color: Colors.red,

          alignment: Alignment.centerRight,
          padding:
              const EdgeInsets.only(right: 20), // Background color when swiping
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 36,
          ),
        ),
        confirmDismiss: (va) async {
          if (va == DismissDirection.endToStart) {
            return true;
          }
          return false;
        },
        onDismissed: (direct) {
          if (direct == DismissDirection.endToStart) {
            print("in horizon");
          }
        },
        child: CustomPaint(
            size: Size(351.w, height),
            painter: isExpanded == true ? ExpandedCustomPainter() : null,
            //foregroundPainter: ExpandedCustomPainter(),
            child: SizedBox(
              height: height,
              width: 351.w,
              //duration: const Duration(milliseconds: 1000),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      widget.dto2 != null
                          ? 0.x
                          : AssetImageWidget(
                              url: Assets.images.user1Img.path,
                              height: 60.h,
                            ),
                      widget.dto2 != null ? 0.x : 20.x,
                      widget.dto2 != null
                          ? 0.x
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: AppText(
                                      "Beneficiary name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(fontSize: 20.fS),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: AppText(
                                      'account name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color:
                                                  LightColorsPalate.greyColor,
                                              fontSize: 14),
                                    ))
                              ],
                            ),
                      widget.dto2 != null
                          ? CustomPaint(
                              painter: CurvedPainter(),
                              size: Size(351.w / 1.29, 50.h),
                              child: SizedBox(
                                height: 50.h,
                                width: 351.w / 1.29,
                                child: Row(
                                  children: [
                                    5.x,
                                    widget.dto2!.iconPath!
                                            .split('.')
                                            .last
                                            .contains('svg')
                                        ? DynamicAppIconHandler.buildIcon(
                                            context: context,
                                            svg: widget.dto2!.iconPath)
                                        : AssetImageWidget(
                                            url: widget.dto2!.iconPath!),
                                    10.x,
                                    AppText(
                                      widget.dto2?.bankName ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall?.copyWith(fontSize: 16),
                                    ),
                                    const Spacer(),
                                    Align(
                                            alignment: Alignment.bottomRight,
                                            child: AppText(
                                              widget.dto2?.bankType ?? "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.copyWith(fontSize: 8),
                                            ))
                                        .withMargin(
                                            const EdgeInsets.only(bottom: 5)),
                                    15.x
                                  ],
                                ),
                              ),
                            )
                          : 0.x,
                      const Spacer(),
                      isExpanded == true
                          ? const Icon(Icons.keyboard_arrow_down)
                              .onTapped(onTap: _expansionChanged)
                          : DynamicAppIconHandler.buildIcon(
                                  iconColor: widget.dto2 != null
                                      ? const Color(0xffF4F4F4)
                                      : null,
                                  svg: Assets.icons.redCurveRect,
                                  context: context)
                              .stackIt([
                              Positioned(
                                  child: Icon(
                                Icons.keyboard_arrow_up_sharp,
                                color: widget.dto2 != null
                                    ? Colors.black
                                    : Colors.white,
                              ))
                            ]).onTapped(onTap: _expansionChanged),
                      isExpanded == true ? 20.x : 0.x
                    ],
                  ),
                  20.y,
                  isExpanded == true && height > maxHeight
                      ? FutureBuilder(
                          builder: (context, dd) {
                            if (dd.connectionState == ConnectionState.done) {
                              return ExpansionChild(
                                dto: widget.dto,
                                dto2: widget.dto2,
                                fromIndividual: widget.dto2 != null,
                              );
                            } else {
                              return 0.y;
                            }
                          },
                          future: Future.delayed(Duration(
                              milliseconds: widget.dto2 != null ? 240 : 290)),
                        )
                      : 0.y,
                ],
              ),
              // color: Colors.grey,
            )).marginHorizontal(22.w),
      ),
    );
  }

  void _expansionChanged() {
    if (isExpanded == true) {
      isExpanded = false;
      height = widget.dto2 != null ? 77.h : 100.h;
      widget.isExpansionChanged(false);
    } else {
      isExpanded = true;
      height = widget.dto2 != null ? 230.h : 270.h;
      // height=220.h;
      widget.isExpansionChanged(true);
    }
    setState(() {});
  }
}

class ExpansionChild extends StatelessWidget {
  const ExpansionChild(
      {super.key, required this.dto, this.dto2, this.fromIndividual});
  final Benficarymodel? dto;
  final Benificaryaccountmodel? dto2;
  final bool? fromIndividual;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            AppText(
              fromIndividual == true ? "From account" : "Name",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            AppText(
              fromIndividual == true ? dto2!.fromAccount : dto!.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: const Color(0xFF9B9B9B), fontSize: 13),
            ),
          ],
        ),
        10.y,
        Row(
          children: [
            AppText(fromIndividual == true ? "To account" : "Bank account",
                style: Theme.of(context).textTheme.bodyMedium),
            const Spacer(),
            AppText(
              fromIndividual == true ? dto2!.toAccount : dto!.bankACCOUNT,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: const Color(0xFF9B9B9B), fontSize: 13),
            ),
          ],
        ),
        10.y,
        fromIndividual == true
            ? 0.y
            : Row(
                children: [
                  AppText(
                    "Account code",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  AppText(
                    dto!.accountCode,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF9B9B9B), fontSize: 13),
                  ),
                ],
              ),
        const Spacer(),
        Row(
          children: [
            fromIndividual == true
                ? 0.x
                : CommonButton(
                    onTap: () {},
                    text: 'Transfer now',
                    backgroundColor: Theme.of(context).colorScheme.onTertiary,
                    height: 35,
                    textSize: 18.fS,
                  ),
            const Spacer(),
            fromIndividual == true
                ? Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  )
                : 0.x,
            fromIndividual == true ? 10.x : 0.x,
            AppText(
              'Edit',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: fromIndividual == true
                      ? LightColorsPalate.primaryColor
                      : LightColorsPalate.benificiaryBlueSelectedColor,
                  decoration: TextDecoration.underline),
            ),
            fromIndividual == true ? 0.x : 15.x,
            fromIndividual == true
                ? 0.x
                : AppText(
                    'Cancel',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: LightColorsPalate.primaryColor,
                        decoration: TextDecoration.underline),
                  ),
            5.x
          ],
        ).withMargin(EdgeInsets.only(bottom: fromIndividual == true ? 10.h : 0))
      ],
    ).marginHorizontal(20));
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2553191);
    path_0.cubicTo(0, size.height * 0.1143102, size.width * 0.01859024, 0,
        size.width * 0.04152249, 0);
    path_0.lineTo(size.width * 0.9674602, 0);
    path_0.cubicTo(
        size.width * 0.9899204,
        0,
        size.width * 1.004997,
        size.height * 0.1417770,
        size.width * 0.9959862,
        size.height * 0.2682979);
    path_0.lineTo(size.width * 0.9555260, size.height * 0.8364553);
    path_0.cubicTo(
        size.width * 0.9489100,
        size.height * 0.9293468,
        size.width * 0.9339827,
        size.height * 0.9893617,
        size.width * 0.9174913,
        size.height * 0.9893617);
    path_0.lineTo(size.width * 0.04152249, size.height * 0.9893617);
    path_0.cubicTo(size.width * 0.01859024, size.height * 0.9893617, 0,
        size.height * 0.8750511, 0, size.height * 0.7340426);
    path_0.lineTo(0, size.height * 0.2553191);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffB11811).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
