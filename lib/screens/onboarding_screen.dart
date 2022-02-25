import 'package:flutter/material.dart';
import 'package:pfoten/getInfoScreen.dart';
import 'package:pfoten/reuasble/customPath.dart';
import 'package:pfoten/utils/colors.dart';
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

  Widget onBoardingComponent(String topic, String subTopic, String imgUrl){
    return Stack(
      children: [
        ClipPath(
          clipper: ClipPathClass(),
          child:  Container(
            height: 45.h,
            width: MediaQuery.of(context).size.width,
            color: primaryColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h, left: 10.w),
          child: Image.asset(
              imgUrl,
              height: 39.h,
              width: 39.h,
              fit: BoxFit.contain
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 48.h, left: 10.w, right: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                topic,
                style: TextStyle(
                    fontFamily: "RobotoSlab",
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                subTopic,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: 10.sp,
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

    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Expanded(
          flex: 10,
          child: Center(
            child: Container(
              color: colorWhite,
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
                    padding: EdgeInsets.only(top: 67.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(_pages.length, (int index) {
                          return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 1.3.h,
                              width: (index == _currentPage) ? 8.w : 2.5.w,
                              margin:
                              const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage)
                                      ? primaryColor
                                      : primaryColor.withOpacity(0.5)));
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
              color: colorWhite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                          fontFamily: "RobotoSlab",
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: primaryColor
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          if(_currentPage==2){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const GetInfoScreen()),
                            );
                          }else{
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeInOutQuint);
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                            radius: 18.sp,
                            child: Icon(Icons.arrow_forward_ios, color: colorWhite, size: 13.sp,)
                        )
                    ),
                  ],
                ),
              ),
            )
        )
      ],
    ),
        ),
    );
  }
}
