import '../screens/companylist_screen.dart';
import '../screens/home_screen.dart';
import '../screens/joblist_screen.dart';
import '../screens/MyAccountScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomeScreen(),
          icon: Icon(
            Icons.home,
          ),
          title: 'Home',
        ),
        TabNavigationItem(
          page: JobListScreen(),
          icon: Icon(Icons.work),
          title: 'Jobs',
        ),
        TabNavigationItem(
          page: CompanyListScreen(),
          icon: Icon(Icons.home_work),
          title: 'Companies',
        ),
        TabNavigationItem(
          page: MyAccountScreen(),
          icon: Icon(Icons.person),
          title: 'My Account',
        ),
      ];
}
