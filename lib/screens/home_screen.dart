// ignore_for_file: deprecated_member_use

import 'package:expenzes_trng/services/user_services.dart';
import 'package:expenzes_trng/utils/colors.dart';
import 'package:expenzes_trng/utils/constants.dart';
import 'package:expenzes_trng/widgets/income_expence_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // for store the user name
  String username = "";
  @override
  void initState() {
    // get the user name from the shared preferences
    UserServices.getUserDetails().then((value) {
      if (value["username"] != null) {
        setState(() {
          username = value['username']!;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // main column for the home screen
          child: Column(
            children: [
              // sub column for the home screen
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kMainColor,
                              border: Border.all(color: kMainColor, width: 3),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              // Replace with your image asset or network image
                              child: Image.asset(
                                "assets/images/user.jpg",
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "welcome $username",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                            ),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              // Add your logout functionality here
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: kMainColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IncomeExpenceCard(
                            title: "Income",
                            amount: 1200,
                            imageUrl: "assets/images/income.png",
                            bgColor: kGreen,
                          ),
                          IncomeExpenceCard(
                            title: "Expence",
                            amount: 2300,
                            imageUrl: "assets/images/expense.png",
                            bgColor: kRed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Add your home screen widgets here

              // More widgets can be added here
            ],
          ),
        ),
      ),
    );
  }
}
