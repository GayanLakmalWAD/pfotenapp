import 'package:flutter/material.dart';
import 'package:pfoten/utils/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Image.asset("images/dog.png", fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400.0, left: 50.0, right: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "On Boarding",
                  style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ksjdfjslad fjlasdlfj lasdl fsadl fjlasjd lfjasd ksjdfjslad fjlasdlfj lasdl fsadl fjlasjd lfjasd",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Image.asset("images/dog.png", fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400.0, left: 50.0, right: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "On Boarding",
                  style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ksjdfjslad fjlasdlfj lasdl fsadl fjlasjd lfjasd ksjdfjslad fjlasdlfj lasdl fsadl fjlasjd lfjasd",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Image.asset("images/dog.png", fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400.0, left: 50.0, right: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "On Boarding",
                  style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ksjdfjslad fjlasdlfj lasdl fsadl fjlasjd lfjasd ksjdfjslad fjlasdlfj lasdl fsadl fjlasjd lfjasd",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ];

    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
            body: Column(
      children: [
        Expanded(
          flex: 8,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(_pages.length, (int index) {
                            return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 10,
                                width: (index == _currentPage) ? 30 : 10,
                                margin:
                                const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: (index == _currentPage)
                                        ? secondaryColor
                                        : secondaryColor.withOpacity(0.5)));
                          })),

                    ],
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Skip",
                      style: TextStyle(
                          fontFamily: "RobotoSlab",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: secondaryColor
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint);
                        },
                        child: const CircleAvatar(
                          backgroundColor: secondaryColor,
                            radius: 23,
                            child: Icon(Icons.arrow_forward_ios, color: colorWhite, size: 15,)
                        )
                    ),
                  ],
                ),
              ),
            )
        )
      ],
    )));
  }
}
