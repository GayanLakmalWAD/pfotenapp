import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/screens/viewAllRemindersScreen.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:sizer/sizer.dart';
import '../utils/dimensions.dart';
import '../utils/textStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Ginger'),
    Tab(text: 'Shadow'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.withOpacity(0),
        leading: Center(
          child: Text(
            "Ginger",
            style: robotoBoldTextStyle.copyWith(
                fontSize: Dimensions.fontSizeLarge
            ),
          ),
        ),
        leadingWidth: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Dimensions.paddingExtraLarge),
            child: CircleAvatar(
              backgroundColor: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/dog.png"),
              ),
            ),
          ),
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            petDetailCard(),
            todayNotes(),
          ],
        ),
      ),
    );
  }

  ///pet Detail Card
  Widget petDetailCard(){
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: Dimensions.paddingDefault),
      child: Container(
          height: 120,
          width: 70.w,
          decoration: const BoxDecoration(
            color: kColorWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/dog.png",
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 8.0, bottom: 8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Age : ',
                              style: robotoRegularTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                            ),
                            TextSpan(
                              text: '12 Months',
                              style: robotoRegularTextStyle.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Weight : ',
                              style: robotoRegularTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                            ),
                            TextSpan(
                              text: '12 Kg',
                              style: robotoRegularTextStyle.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Breed : ',
                              style: robotoRegularTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                            ),
                            TextSpan(
                              text: 'Labrador',
                              style: robotoRegularTextStyle.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }

  ///today notes
  Widget todayNotes(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: Dimensions.paddingLarge, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Today",
                style: robotoBoldTextStyle.copyWith(
                    fontSize: Dimensions.fontSizeLarge
                ),
              ),
              IconButton(
                icon: const Icon(Icons.apps_sharp, color: primaryColor),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: (1000).round()),
                        pageBuilder: (context, animation, secondaryAnimation) => const ViewAllRemindersScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeThroughTransition(animation: animation, secondaryAnimation: secondaryAnimation, child: child);
                        },
                      )
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ViewAllRemindersScreen()),
                  // );
                },
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(Dimensions.paddingLarge, 8.0, 20, 8.0),
              child: Container(
                width: 50.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Vaccination",
                              style: robotoBoldTextStyle.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Sub topic",
                              style: robotoBoldTextStyle.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: Dimensions.fontSizeExtraSmall,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "2022/10/06",
                            textAlign: TextAlign.left,
                            style: robotoBoldTextStyle.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              color: const Color(0xffbdbdbd),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.notifications_active_outlined, color: primaryColor),
                    ],
                  ),
               )
              ),
            );
          },
        ),
      ],
    );
  }

  ///SideDrawer menu
  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Add Pet"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Help and feedBack"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Tell a friend"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
            const Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: const Text("Rate us"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
            const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Account settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

}
