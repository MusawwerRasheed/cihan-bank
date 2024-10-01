import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:gif_view/gif_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        context.pushAndRemoveUntil(const SignInScreen(), (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryManager().initialize(context);
    final themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 11.sh,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              LightColorsPalate.gred2Color,
              LightColorsPalate.gred2Color,
              LightColorsPalate.gred3Color,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: AssetImageWidget(
                url: Assets.images.splashTopImg.path,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 400,
              // Adjust this value to control the vertical position of the logo
              left: 0,
              right: 0,
              child: Center(
                child: GifView.asset(
                  'assets/Gif/gif.gif',
                  height: 200,

                  width: 200,

                  frameRate: 30, // default is 15 FPS
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 610,
              child: AssetImageWidget(
                url: Assets.images.splashBottomImg.path,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Text(
                // overflow:
                "Seamless money management, effortless transactions and personalized financial insights.",
                textAlign: TextAlign.center,
                style: themeData.textTheme.displaySmall,
              ).padHorizontal(54),
            ),
            Positioned(
              bottom: 240,
              left: 0,
              right: 0,
              child: Text(
                "Mobile Banking the world loves",
                textAlign: TextAlign.center,
                style: themeData.textTheme.headlineLarge,
              ).padHorizontal(40),
            ),
          ],
        ),
      ),
    );
  }
}
