import 'package:flutter/widgets.dart';

enum IncomeCategory { salary, business, investment, rental, freelance, other }

class IncomeModel {
  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final IncomeCategory category;
  final String description;
  final DateTime time;

  // category image URL mapping
  final Map<IncomeCategory, String> incomeCategoryImages = {
    IncomeCategory.salary: 'assets/images/salary.png',
    IncomeCategory.business: 'assets/images/business.png',
    IncomeCategory.investment: 'assets/images/investment.png',
    IncomeCategory.rental: 'assets/images/rental.png',
    IncomeCategory.freelance: 'assets/images/freelance.png',
    IncomeCategory.other: 'assets/images/other.png',
  };

  // category color mapping
  final Map<IncomeCategory, Color> incomeCategoryColors = {
    IncomeCategory.salary: Color(0xFF4CAF50), // Green
    IncomeCategory.business: Color(0xFF2196F3), // Blue
    IncomeCategory.investment: Color(0xFFFFC107), // Amber
    IncomeCategory.rental: Color(0xFFFF5722), // Deep Orange
    IncomeCategory.freelance: Color(0xFF9C27B0), // Purple
    IncomeCategory.other: Color(0xFF9E9E9E), // Grey
  };

  IncomeModel(
    this.title,
    this.time, {
    required this.id,
    required this.amount,
    required this.date,
    required this.category,
    this.description = '',
  });
}
