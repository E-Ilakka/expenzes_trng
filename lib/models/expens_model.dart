// enum for expense categories
import 'package:flutter/material.dart';

enum ExpenseCategory { food, transport, health, shopping, other }

// catogory images
final Map<ExpenseCategory, String> expensCategoryImages = {
  ExpenseCategory.food: 'assets/images/restaurant.png',
  ExpenseCategory.transport: 'assets/images/car.png',
  ExpenseCategory.health: 'assets/images/health.png',
  ExpenseCategory.shopping: 'assets/images/bag.png',
  ExpenseCategory.other: 'assets/images/bill.png',
};

// category color mapping
final Map<ExpenseCategory, Color> expensCategoryColors = {
  ExpenseCategory.food: Color(0xFF4CAF50), // Green
  ExpenseCategory.transport: Color(0xFF2196F3), // Blue
  ExpenseCategory.health: Color(0xFFFFC107), // Amber
  ExpenseCategory.shopping: Color(0xFFFF5722), // Deep Orange
  ExpenseCategory.other: Color(0xFF9E9E9E), // Grey
};

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  // Factory method to create an Expense object from a map
}
