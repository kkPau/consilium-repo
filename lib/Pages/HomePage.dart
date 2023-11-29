// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../tab_screens/chats_tab.dart';
import '../tab_screens/home_tab.dart';
import '../tab_screens/settings_tab.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _pages = [
    {'page' : HomeTab()},
    {'page' : ChatsTab()},
    {'page' : SettingsTab()},
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(45),
          //   topRight: Radius.circular(45),
          // ),
          border: Border.all(color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 3,
          ),
          child: GNav(
            onTabChange: (index){
              _selectedPage(index);
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            selectedIndex: _selectedPageIndex,
            curve: Curves.bounceInOut,
            haptic: true,
            gap: 10,
            tabBackgroundColor: Theme.of(context).colorScheme.background,
            backgroundColor: Theme.of(context).colorScheme.primary,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.secondary,
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chats',
                iconColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.secondary,
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
                iconColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}