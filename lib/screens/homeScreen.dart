import 'package:flutter/material.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Ginger'),
    // Tab(text: 'Shadow'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SideMenu(
        key: _endSideMenuKey,
        inverse: true, // end side menu
        type: SideMenuType.slideNRotate,
        menu: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: buildMenu(),
        ),
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: SideMenu(
          key: _sideMenuKey,
          menu: buildMenu(),
          background: primaryColor,
          type: SideMenuType.slideNRotate,
          onChange: (_isOpened) {
            setState(() => isOpened = _isOpened);
          },
          child: IgnorePointer(
            ignoring: isOpened,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: scaffoldBackgroundColor,
                centerTitle: true,
                leading: const SizedBox(),
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, color: primaryColor,),
                        onPressed: () => toggleMenu(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_active_outlined, color: primaryColor),
                        onPressed: () => null,
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  indicatorWeight: 3,
                  indicatorColor: secondaryColor,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.sp),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                  controller: _tabController,
                  tabs: myTabs,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: primaryColor,
                child: const Icon(Icons.add, color: colorWhite,),
                onPressed: (){

                },
              ),
              body: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          petDetailCard(),
                          todayNotes()
                        ],
                      ),
                    ),
                    // showClimateUI(),
                  ]
              ),
            ),
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
            height: 30.w,
            width: 30.w,
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
                  fontSize: 14.sp,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.apps_sharp, color: primaryColor),
                onPressed: () => null,
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
                height: 10.h,
                width: 50.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
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
