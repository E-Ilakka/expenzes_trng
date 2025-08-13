// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'dart:convert';

import 'package:expenzes_trng/models/expens_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenceService {
  //expencevlist
  List<ExpenseModel> expensesList = [];
  // Define the key for storing expenses in shared preferences
  static const String _expensesKey = 'expenses';

  //Save the expense to shared preferences
  Future<void> saveExpense(ExpenseModel expense, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingExpenses = prefs.getStringList(_expensesKey);

      // Convert the existing expenses to a list of Expense objects
      List<ExpenseModel> existingExpenseObjects = [];
      if (existingExpenses != null) {
        existingExpenseObjects = existingExpenses
            .map((e) => ExpenseModel.fromJson(json.decode(e)))
            .toList();
      }

      // Add the new expense to the list
      existingExpenseObjects.add(expense);

      // Convert the list of Expense objects back to a list of strings
      List<String> updatedExpenses = existingExpenseObjects
          .map((e) => json.encode(e.toJson()))
          .toList();

      // Save the updated list of expenses to shared preferences
      await prefs.setStringList(_expensesKey, updatedExpenses);

      //show snackbar
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Expense added successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error on Adding Expense'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //Load the expenses from shared preferences
  Future<List<ExpenseModel>> loadExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? existingExpenses = prefs.getStringList(_expensesKey);

    // Convert the existing expenses to a list of Expense objects
    List<ExpenseModel> loadedExpenses = [];
    if (existingExpenses != null) {
      loadedExpenses = existingExpenses
          .map((e) => ExpenseModel.fromJson(json.decode(e)))
          .toList();
    }

    // Return the list of loaded expenses
    return loadedExpenses;
  }

  //Delete the expense from shared preferences from the id
  Future<void> deleteExpense(int id, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingExpenses = prefs.getStringList(_expensesKey);

      // Convert the existing expenses to a list of Expense objects
      List<ExpenseModel> existingExpenseObjects = [];
      if (existingExpenses != null) {
        existingExpenseObjects = existingExpenses
            .map((e) => ExpenseModel.fromJson(json.decode(e)))
            .toList();
      }

      // Remove the expense with the specified id from the list
      existingExpenseObjects.removeWhere((element) => element.id == id);

      // Convert the list of Expense objects back to a list of strings
      List<String> updatedExpenses = existingExpenseObjects
          .map((e) => json.encode(e.toJson()))
          .toList();

      // Save the updated list of expenses to shared preferences
      await prefs.setStringList(_expensesKey, updatedExpenses);

      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expense deleted successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error on Deleting Expense'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //delete all expenses from shared preferences
  Future<void> deleteAllExpenses(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(_expensesKey);

      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All expenses deleted successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error on Deleting All Expense'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
