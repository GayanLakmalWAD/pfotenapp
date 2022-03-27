import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/screens/viewAllRemindersScreen.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:sizer/sizer.dart';

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
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          centerTitle: true,
          leading: const SizedBox(),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                indicatorWeight: 3,
                indicatorColor: secondaryColor,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.sp),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                controller: _tabController,
                tabs: myTabs,
              ),
            ],
          ),
          // flexibleSpace: Padding(
          //   padding: const EdgeInsets.only(top: 10.0, left: 20, right: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       GestureDetector(
          //         onTap: (){
          //           // _showPicker(context);
          //         },
          //         child: CircleAvatar(
          //           radius: 18.sp,
          //           backgroundColor: Colors.white,
          //           child: Image.asset("images/dog.png"),
          //           // _imageFile == null ?
          //           // CircleAvatar(
          //           //   radius: 20,
          //           //   backgroundColor: Colors.white.withOpacity(0.5),
          //           //   backgroundImage:
          //           // ) :
          //           // CircleAvatar(
          //           //   radius: widthScale * 20,
          //           //   backgroundColor: Colors.white,
          //           //   backgroundImage: FileImage(File(_imageFile!.path)),
          //           // ),
          //         ),
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.notifications_active_outlined, color: primaryColor),
          //         onPressed: () => null,
          //       ),
          //     ],
          //   ),
          // ),
          // bottom: TabBar(
          //   indicatorWeight: 3,
          //   indicatorColor: secondaryColor,
          //   labelColor: Colors.white,
          //   labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.sp),
          //   unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          //   controller: _tabController,
          //   tabs: myTabs,
          // ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              petDetailCard(),
              todayNotes(),
            ],
          ),
        ),
      ),
    );
  }

  ///pet Detail Card
  Widget petDetailCard(){
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 110,
            width: 110,
            decoration: const BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Image.asset(
              "images/dog.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Age : ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '12 Months',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Weight : ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '12 Kg',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Breed : ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Labrador',
                        style: TextStyle(
                          fontSize: 12.sp,
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
    );
  }

  ///today notes
  Widget todayNotes(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 30, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Today",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
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
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20, 8.0),
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
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0,
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
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0,
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
                            style: TextStyle(
                              color: const Color(0xffbdbdbd),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0,
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
