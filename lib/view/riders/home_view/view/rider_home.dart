// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/rider_order_view/view/rider_order_home_screen.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/view/rider_profile_home.dart';
import 'package:discount_me_app/view/riders/subscription_view/view/subscription_home_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class RiderHome extends StatefulWidget {
  const RiderHome({super.key});

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {

  int _selectedIndex = 0;
  // List of body views based on selected index
  static List<Widget> _bodyOptions = <Widget>[
    RiderHomeScreen(),
    SubscriptionHomeScreen(),
    RiderOrderHomeScreen(),
    RiderProfileHome(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _bodyOptions[_selectedIndex],

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: AppColors.primaryColor,
                    offset: Offset(0, 1),blurRadius: 5
                )
              ]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 20),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              selectedFontSize: 14,
              unselectedFontSize: 12,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              enableFeedback: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 28.sp),
                  activeIcon: Icon(Icons.home, size: 28.sp),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppImages.subscription, scale: 4,),
                  activeIcon: Image.asset(AppImages.subscriptionOutline, scale: 4,),
                  label: 'Subscription',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppImages.navOrderIcon, scale: 4,),
                  activeIcon: Image.asset(AppImages.navOrderOutlineIcon, scale: 4,),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 28.sp),
                  activeIcon: Icon(Icons.person, size: 28.sp),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
    );
  }
}