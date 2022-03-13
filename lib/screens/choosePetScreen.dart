import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pfoten/screens/getPetDetailsScreen.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:sizer/sizer.dart';

class Pet {
  final String? url;
  final String? title;

  const Pet({this.url, this.title});
}

const pets = [
  Pet(
      url: 'images/dog1.jfif', title: 'DOG'),
  Pet(
      url:
      'images/cat1.jfif',
      title: 'CAT'),
];

class ChoosePetScreen extends StatefulWidget {
  const ChoosePetScreen({Key? key}) : super(key: key);

  @override
  _ChoosePetScreenState createState() => _ChoosePetScreenState();
}

class _ChoosePetScreenState extends State<ChoosePetScreen> {
  final pageController = PageController(viewportFraction: 0.7);
  final ValueNotifier<double?> _pageNotifier = ValueNotifier(0.0);

  void _listener() {
    _pageNotifier.value = pageController.page;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      pageController.addListener(_listener);
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: ValueListenableBuilder<double?>(
                  valueListenable: _pageNotifier,
                  builder: (context, value, child) {
                    return Stack(
                      children: pets.reversed
                          .toList()
                          .asMap()
                          .entries
                          .map(
                            (entry) => Positioned.fill(
                          child: ClipRect(
                            clipper: MyClipper(
                              percentage: value,
                              title: entry.value.title,
                              index: entry.key,
                            ),
                            child: Image.asset(
                              entry.value.url!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    );
                  }),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: size.height / 3,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        accentColor,
                        accentColor,
                        accentColor,
                        Colors.white60,
                        Colors.white24,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: PageView.builder(
                  itemCount: pets.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    final lerp =
                    lerpDouble(0, 1, (index - _pageNotifier.value!).abs())!;

                    double opacity =
                    lerpDouble(0.0, 0.5, (index - _pageNotifier.value!).abs())!;
                    if (opacity > 1.0) opacity = 1.0;
                    if (opacity < 0.0) opacity = 0.0;
                    return Transform.translate(
                      offset: Offset(0.0, lerp * 50),
                      child: Opacity(
                        opacity: (1 - opacity),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Card(
                            color: accentColor,
                            borderOnForeground: true,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: borderRadius,
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: SizedBox(
                              height: size.height / 1.5,
                              width: size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 23.0, left: 23.0, right: 23.0),
                                      child: ClipRRect(
                                        borderRadius: borderRadius,
                                        child: Image.asset(
                                          pets[index].url!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(15.0, 30, 15, 15),
                                      child: Text(
                                        pets[index].title!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "RobotoSlab",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.sp,
                                          color: Colors.black
                                      ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              left: size.width / 3.3,
              bottom: 40,
              width: size.width / 2.5,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetPetDetailsScreen()),
                  );
                },
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                      color: primaryColor
                  ),
                  child: Center(
                    child: Text(
                      'SELECT',
                      style: TextStyle(
                          fontFamily: "RobotoSlab",
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: colorWhite
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 2.h,
              left: 3.w,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                ),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 18.sp,
                  child: const Center(
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 3.5.h,
              left: 26.w,
              width: 100.w,
              child: Text("Choose your Pet type",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  final double? percentage;
  final String? title;
  final int? index;

  MyClipper({
    this.percentage = 0.0,
    this.title,
    this.index,
  });

  @override
  Rect getClip(Size size) {
    int currentIndex = pets.length - 1 - index!;
    final realPercent = (currentIndex - percentage!).abs();
    if (currentIndex == percentage!.truncate()) {
      return Rect.fromLTWH(
          0.0, 0.0, size.width * (1 - realPercent), size.height);
    }
    if (percentage!.truncate() > currentIndex) {
      return Rect.fromLTWH(0.0, 0.0, 0.0, size.height);
    }
    return Rect.fromLTWH(0.0, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}