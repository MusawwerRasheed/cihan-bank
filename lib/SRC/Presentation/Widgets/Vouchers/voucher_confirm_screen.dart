import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Vouchers/voucher_invoice.dart';
import 'package:flutter/cupertino.dart';

class VoucherConfirmScreen extends StatefulWidget {
  const VoucherConfirmScreen({super.key});

  @override
  State<VoucherConfirmScreen> createState() => _VoucherConfirmScreenState();
}

class _VoucherConfirmScreenState extends State<VoucherConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 1.stB + 18,
          ),
          TopBar(horizontalPad: 24),
          Expanded(
            child: ListView(
              children: [
                AssetImageWidget(
                  url: Assets.images.logoImg.path,
                  height: 163,
                  width: 163,
                  fit: BoxFit.contain,
                ),
                40.y,
                Center(
                  child: AppText(
                    maxLine: 2,
                    textAlign: TextAlign.center,
                    "Verification Voucher\nPayment",
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
                30.y,
                const PinCodeWidget().padHorizontal(30),
                22.y,
                Center(
                  child: AppText(
                    maxLine: 3,
                    "A code has been sent to your\nphone number",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ),
                80.y,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(
                      maxLine: 1,
                      "Resend in",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    8.x,
                    AppText(
                      maxLine: 1,
                      "00:30",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontSize: 24,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CommonButton(
        onTap: () {
          CommonDialogs.showSuccessDialogue(
              context: context, title: 'Successful request!');
          Future.delayed(const Duration(seconds: 3), () {
            context.back();
            context.to(const VoucherInvoice());
          });
        },
        text: 'Verify',
        horizontalMargin: 24,
        verticalMargin: 16,
      ),
    );
  }
}
