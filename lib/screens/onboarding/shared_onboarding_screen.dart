import 'package:expenzes_trng/utils/colors.dart';
import 'package:expenzes_trng/utils/constants.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const SharedOnboardingScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 300, fit: BoxFit.cover),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            description,
            style: TextStyle(fontSize: 16, color: kGrey),
          ),
        ],
      ),
    );
  }
}
