// ignore_for_file: avoid_unnecessary_containers

import 'package:expenzes_trng/screens/add_new_screen.dart';
import 'package:expenzes_trng/screens/budget_screen.dart';
import 'package:expenzes_trng/screens/home_screen.dart';
import 'package:expenzes_trng/screens/profile_screen.dart';
import 'package:expenzes_trng/screens/transactions_screen.dart';
import 'package:expenzes_trng/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Current page index for the bottom navigation bar
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Screen list
    final List<Widget> screens = [
      HomeScreen(),
      TransactionsScreen(),
      AddNewScreen(),
      BudgetScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 30, color: kWhite),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: 'Budget'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: screens[_currentPageIndex],
    );
  }
}
