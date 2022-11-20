import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:introduction_screen/introduction_screen.dart';

import '../../../app/animation/routes_animation.dart';
import '../../../app/util/util.dart';
import '../login/login_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void onIntroEnd(context) {
    Navigator.push(context, CustomRoutesPage(widget: const LoginScreen()));
  }

  Widget buildImage(String img, [double width = 350]) {
    return Image.asset(
      '${AppImage.path}/$img',
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        fontFamily: AppConstant.poppinsFont);
    const pageDecoration = PageDecoration(
        bodyTextStyle: bodyStyle,
        bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700));
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: HexColor.fromHex(AppColor.lightBackgroundColor),
      globalFooter: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: HexColor.fromHex(AppColor.primaryBtnColor),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            child: const Text(
              'Let\'s start',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => onIntroEnd(context),
          )),
      pages: [
        PageViewModel(
            title: 'Discover create folder',
            body:
                "We can create folder to contain file and any file that you want",
            image: buildImage(AppImage.splash1),
            decoration: pageDecoration),
        PageViewModel(
            title: 'Discover upload file',
            body: "We can upload file in folder ",
            image: buildImage(AppImage.splash2),
            decoration: pageDecoration),
        PageViewModel(
            title: 'Discover share member access',
            body: "We can share member access file or folder",
            image: buildImage(AppImage.splash3),
            decoration: pageDecoration),
      ],
      onDone: () => onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16.0),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      dotsDecorator: DotsDecorator(
        activeColor: HexColor.fromHex(AppColor.primaryBtnColor),
        size: const Size(10.0, 10.0),
        color: HexColor.fromHex(AppColor.grayBackgroundColor),
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
