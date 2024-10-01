import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/responsive_extention.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/common_button.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/top_bar.dart';
import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(
            horizontalPad: 24,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Center(
                  child: AppText(
                    "Terms & Conditions",
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
                20.y,
                AppText(
                  maxLine: 1000,
                  '''Terms and Conditions These terms and conditions, along with their electronic amendments, regarding the procedures for identifying the client and verifying their identity using electronic means for the purpose of granting an electronic account.
            
            In the event that the client visits the bank to request products and services not available for the electronic account, face-to-face procedures with the client will be applied according to the procedures in our bank.
            
            In case of any complaints related to the implementation of these terms and conditions, the client has the right to submit a complaint to the Bank's Banking Awareness Department, which is announced in the bank branches and website (the bank's specific email), and the bank will investigate the complaint and inform the complainant of the outcome within (30) days at most from the date of submitting the complaint.
            
            The provisions of the Iraqi laws regulating electronic transactions, Iraqi civil law, and other applicable regulations and laws in Iraq apply to these terms and conditions, provided that they do not contradict the provisions and principles of Islamic Sharia. The client agrees to the jurisdiction of any court chosen by the bank to settle any dispute and/or claim arising from these terms and conditions and the general and specific provisions and annexes directly or indirectly, waiving their right to object to the jurisdiction and competence of the court chosen by the bank.
            
            Client's Name: 
            Account Number: 
            Date:''',
                  style: theme.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: theme.colorScheme.tertiary),
                ),
                120.y,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.y,
          CommonButton(
            onTap: () {},
            verticalMargin: 0,
            text: 'Agree',
            horizontalMargin: 24,
          ),
          8.y,
          CommonButton(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            onTap: () {},
            verticalMargin: 0,
            text: 'Cancel',
            horizontalMargin: 24,
          ),
          10.y,
        ],
      ),
    );
  }
}
