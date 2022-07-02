import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pfoten/screens/choosePetScreen.dart';
import 'package:pfoten/reuasble/customPath.dart';
import 'package:pfoten/screens/signIn_screen.dart';
import 'package:pfoten/screens/signup_screen.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:pfoten/utils/dimensions.dart';
import 'package:pfoten/utils/textStyles.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget onBoardingComponent(String topic, String subTopic, String imgUrl) {
    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                height: 360,
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(child: Image.asset(imgUrl, height: 40.h, width: 40.h, fit: BoxFit.contain)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.paddingDefault, right: Dimensions.paddingDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: Dimensions.paddingDefault,
              ),
              Text(
                topic,
                style: robotoSlabBoldTextStyle.copyWith(fontSize: Dimensions.fontSizeOverLarge),
              ),
              const SizedBox(
                height: Dimensions.paddingDefault,
              ),
              Text(
                subTopic,
                style: robotoRegularTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  color: kColorGrey,
                  fontSize: Dimensions.fontSizeExtraSmall
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light
    ));

    final List<Widget> _pages = [
      onBoardingComponent(
        'OnBoarding 1',
        "App onboarding is key for one core reason: if users don't understand your app, ... Avoid text-heavy explanations and opt instead for app screenshots.",
        "images/dog.png",
      ),
      onBoardingComponent(
        'OnBoarding 2',
        "A review of 3 mobile apps: Slack, Trip and Feedly in terms of the way that they have implemented inspirational user onboarding techniques.",
        "images/cat.png",
      ),
      onBoardingComponent(
        'OnBoarding 3',
        "Welcome messages: The definitive first impression for your mobile app. First impressions count, both for people and products. Apps have one.",
        "images/catDog.png",
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: Container(
                  color: kColorWhite,
                  child: Stack(
                    children: [
                      SizedBox(
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: _onchanged,
                          controller: _pageController,
                          // itemCount: _pages.length,
                          itemCount: 3,
                          itemBuilder: (context, int index) {
                            return _pages[index];
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 68.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(_pages.length, (int index) {
                              return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 1.5.h,
                                  width: (index == _currentPage) ? 8.w : 2.5.w,
                                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: (index == _currentPage) ? primaryColor : primaryColor.withOpacity(0.5)));
                            })),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: kColorWhite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Skip",
                          style: robotoSlabRegularTextStyle.copyWith(
                              fontFamily: "RobotoSlab",
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.fontSizeDefault,
                              color: primaryColor
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              if (_currentPage == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignInScreen()),
                                );
                              } else {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 800), curve: Curves.easeInOutQuint);
                              }
                            },
                            child: const SizedBox(
                              height: 55,
                              width: 60,
                              child: Padding(
                                padding: EdgeInsets.only(left: Dimensions.paddingDefault),
                                child: CircleAvatar(
                                    backgroundColor: primaryColor,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: kColorWhite,
                                    )),
                              ),
                            )),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
