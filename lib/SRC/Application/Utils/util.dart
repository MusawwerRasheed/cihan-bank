import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class Util {
  static final List<String> titles = [
    "Account Services",
    "Card Services",
    "Transfer Services",
    "Manage Beneficiaries",
    "ChequeBook Management",
    "Requests",
    "Others"
  ];
  static final List<String> endtitles = [
    "20",
    "180",
    "500",
    "30",
  ];

  static final List<String> serviceTitle = [
    "E-Vouchers",
    "Mobile Charging",
  ];
  static final List<String> serviceSubTitle = [
    "Check all available vouchers ",
    "Flexible charging amounts",
  ];
  static final List<Color> colors = [
    LightColorsPalate.blueBlur.withOpacity(0.25),
    LightColorsPalate.redBlur.withOpacity(0.25),
    LightColorsPalate.purpleBlur.withOpacity(0.25),
    LightColorsPalate.orangeBlur.withOpacity(0.25),
    LightColorsPalate.greyBlur.withOpacity(0.25),
    LightColorsPalate.pistaBlur.withOpacity(0.25),
    LightColorsPalate.greenBlur.withOpacity(0.25),
  ];
  static final List<String> allTransferServicesTexts = [
    'Between My Accounts',
    'Chain Account Transfer',
    'Local Transfer',
    'External Transfer',
    'Transfer to a Card',
  ];
  static final List<List<String>> serviceImages = [
    [
      Assets.images.xboxImg.path,
      Assets.images.nintedoImg.path,
      Assets.images.playstationImg.path,
    ],
    [
      Assets.images.asiaCell.path,
      Assets.images.zain.path,
      Assets.images.korek.path,
    ],
  ];
  static final List<String> selectAccountTitles = [
    'Auto F-Past Due IQD',
    'Auto F-Murabaha IQD',
    'Current Main IQD',
  ];

  static final List<String> selectAccountSubtitles = [
    'Current Account',
    'Saving Account',
    'Current Account',
  ];
  static final List<String> selectAccountPrices = [
    '17,990',
    '12,333',
    '39,939'
  ];

  final List<String> selectAccountIcons = [
    Assets.icons.flagFinishIcon,
    Assets.icons.flagFinishIcon,
    Assets.icons.flagFinishIconGreen,
  ];

  static final List<dynamic> allTransferServices = [
    Assets.icons.betweenMyAccounts,
    Assets.images.cihanBankImage.path,
    Assets.icons.localTransfer,
    Assets.icons.externalTransfer,
    Assets.icons.transferToACard,
  ];
  static final List<List<String>> icons = [
    [
      Assets.icons.allAccounts,
      Assets.icons.requestStatement,
      Assets.icons.accountStatement,
      Assets.icons.serviceNewAccount,
    ],
    [
      Assets.icons.allCards,
      Assets.icons.cardTransations,
      Assets.icons.statementInquiries,
      Assets.icons.cardDetails,
    ],
    [
      Assets.icons.internalTransfer,
      Assets.icons.withInBankTranser,
      Assets.icons.domesticTransfer,
      Assets.icons.internationalTransfer,
    ],
    [
      Assets.icons.allBenefeciries,
      Assets.icons.newBenefeciery,
      Assets.icons.bankBenefecieryTransfer,
      Assets.icons.domesticBenefecieryTransfer,
    ],
    [
      Assets.icons.stopCheck,
      Assets.icons.requestCheck,
    ],
    [
      Assets.icons.financingRequest,
      Assets.icons.newAccount,
      Assets.icons.newStandingOrder,
    ],
    [
      Assets.icons.myCalendar,
      Assets.icons.pendingRequest,
      Assets.icons.myInformation,
      Assets.icons.notification,
    ],
  ];

  static final List<List<String>> cardsText = [
    [
      "All accounts",
      "Request Statement",
      "Account Statement",
      "New Account",
    ],
    [
      "All Cards",
      "Card Transactions",
      "Statement Inquiries",
      "Card Details",
    ],
    [
      "Internal Transfer",
      "Within Bank Transfer",
      "Domestic Transfer",
      "International Transfer",
    ],
    [
      "All Beneficiaries",
      "New Beneficiary",
      "Bank  Beneficiary Transfer",
      "Domestic Beneficiary Transfer",
    ],
    [
      "Stop Cheque",
      "Request Cheque",
    ],
    [
      "Financing Request",
      "New Account",
      "New Standing Order",
    ],
    ["My Calendar", "Pending Requests", "My Information", "Notifications"],
  ];

  static final List<String> chipBottomTitles = [
    "View all accounts",
    "Open your card wallet now",
    "Start transfer services from here",
    "Import from your contacts",
    "Manage your cheque books from here",
    "Keep up-to-date for all requests, view all",
    "Keep up-to-date for all requests, view all"
  ];
  static final List<String> icon = [
    Assets.images.father.path,
    Assets.images.mom.path,
    Assets.images.s.path,
    Assets.images.ahmed.path,
  ];
  static final List<String> socialIcons = [
    Assets.images.logoImg.path,
    Assets.images.facebook.path,
    Assets.images.instagram.path,
    Assets.images.linkedin.path,
    Assets.images.youtube.path,
  ];
  static final List<Color> color = [
    LightColorsPalate.lightPinkColor,
    LightColorsPalate.avatarGreyLightColor,
    LightColorsPalate.greenLightColor,
    LightColorsPalate.lightblueColor,
  ];

  static final List<Color> cardColor = [
    LightColorsPalate.successColor,
    LightColorsPalate.errorColor,
    LightColorsPalate.errorColor,
    LightColorsPalate.errorColor,
  ];

  static final List<String> names = ["Father", "Mom", "School", "Ahmed"];
  static final List<String> historyTransectionDetail = [
    "Settlement Of Arrears Installments 98237540 30 From Al-Madina St. Branch",
    "Settlement Of Arrears Installments 98237540 30 From Al-Madina St. Branch",
    "Settlement Of Arrears Installments 98237540 30 From Al-Madina St. Branch",
    "Settlement Of Arrears Installments 98237540 30 From Al-Madina St. Branch",
  ];

  //Favourite Screen

  static final List<String> favouriteTitle = [
    "Your Favourite",
    "Account Services",
    "Card Services",
    "Transfer Services",
    "Manage Beneficiaries",
    "ChequeBook Management",
  ];
  static final List<String> favouriteChipBottomTitles = [
    "Add text here",
    "Add text here",
    "View all accounts",
    "Open your card wallet now",
    "Start transfer services from here",
    "Import from your contacts",
    "Manage your cheque books from here",
  ];
}
