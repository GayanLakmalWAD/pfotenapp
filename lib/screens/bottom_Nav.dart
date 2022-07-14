import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/screens/createEditReminderScreen.dart';
import 'package:pfoten/screens/homeScreen.dart';
import 'package:pfoten/screens/settings_screen.dart';
import 'package:pfoten/utils/colors.dart';
import 'choosePetScreen.dart';
import 'explore_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home,
    Icons.explore,
    Icons.supervised_user_circle_sharp,
    Icons.settings,
  ];

  final screenList = const [
    HomeScreen(),
    ExploreScreen(),
    ChoosePetScreen(),
    SettingsScreen(),
  ];

  final bottomNavNames = [
    "Home",
    "Explore",
    "Profile",
    "Settings",
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 0),
          () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      extendBody: true,
      body: screenList[_bottomNavIndex],
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: primaryColor,
          child: const Icon(
            Icons.add,
            color: kColorWhite,
          ),
          onPressed: () {
            _animationController.reset();
            _animationController.forward();

            // OpenContainer(
            //   transitionDuration: const Duration(milliseconds: 500),
            //   closedBuilder: (BuildContext c, VoidCallback action) =>
            //       ElevatedButton(child: Text("Open"),
            //           onPressed: ()=>action()),
            //   openBuilder: (BuildContext c, VoidCallback action) => const CreateEditReminderScreen(),
            //   tappable: true,
            // );
            Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: (1000).round()),
                  pageBuilder: (context, animation, secondaryAnimation) => const CreateEditReminderScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeThroughTransition(animation: animation, secondaryAnimation: secondaryAnimation, child: child);
                  },
                )
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const CreateEditReminderScreen()),
            // );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? secondaryColor : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  bottomNavNames[index],
                  maxLines: 1,
                  style: TextStyle(color: color),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        splashRadius: 0,
        backgroundColor: primaryColor,
        activeIndex: _bottomNavIndex,
        splashColor: secondaryColor,
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}