import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Data.app.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ValueListenableBuilder(
      builder: (context, localeVal, locWid) {
        return ValueListenableBuilder(
          valueListenable: AppTheme.instance.currentTheme,
          builder: (ctx, themeVal, oldWidget) => MaterialApp(
            navigatorKey: AppContext.navigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              //AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            locale: localeVal,
            title: 'Cihan Bank  ',
            themeMode: themeVal,
            theme: AppTheme.instance.lightTheme,
            home:const  SplashScreen(),
          ),
        );
      },
      valueListenable: AppLocale.appLocale,
    );
  }
}
