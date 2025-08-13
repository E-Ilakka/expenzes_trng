// ignore_for_file: deprecated_member_use, annotate_overrides

import 'package:expenzes_trng/models/expens_model.dart';
import 'package:expenzes_trng/models/income_model.dart';
import 'package:expenzes_trng/utils/colors.dart';
import 'package:expenzes_trng/utils/constants.dart';
import 'package:expenzes_trng/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  // state to track the expense or income selection
  int _selectedMethode = 0;

  ExpenseCategory _expenseCategory = ExpenseCategory.food;
  IncomeCategory _incomeCategory = IncomeCategory.salary;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethode == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Stack(
              children: [
                // expense and income toggle menu
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethode = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedMethode == 0 ? kRed : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              child: Text(
                                "Expens",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: _selectedMethode == 0
                                      ? kWhite
                                      : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethode = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedMethode == 1 ? kGreen : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: _selectedMethode == 1
                                      ? kWhite
                                      : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // amount input field
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How much",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: kLightGrey.withOpacity(0.8),
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // user data form
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                  ),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        children: [
                          // category selector dropdown
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: "Category",
                              labelStyle: TextStyle(
                                color: kLightGrey.withOpacity(0.8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: kLightGrey.withOpacity(0.5),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: kDefaultPadding,
                              ),
                            ),
                            items: _selectedMethode == 0
                                ? ExpenseCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList()
                                : IncomeCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList(),
                            value: _selectedMethode == 0
                                ? _expenseCategory
                                : _incomeCategory,
                            onChanged: (value) {
                              setState(() {
                                _selectedMethode == 0
                                    ? _expenseCategory =
                                          value as ExpenseCategory
                                    : _incomeCategory = value as IncomeCategory;
                              });
                            },
                          ),
                          SizedBox(height: kDefaultPadding),
                          // title input field
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              labelText: "Title",
                              labelStyle: TextStyle(
                                color: kLightGrey.withOpacity(0.8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: kLightGrey.withOpacity(0.5),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: kDefaultPadding,
                              ),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          // description input field
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              labelText: "Description",
                              labelStyle: TextStyle(
                                color: kLightGrey.withOpacity(0.8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: kLightGrey.withOpacity(0.5),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: kDefaultPadding,
                              ),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          // amount input field
                          TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Amount",
                              labelStyle: TextStyle(
                                color: kLightGrey.withOpacity(0.8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: kLightGrey.withOpacity(0.5),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: kDefaultPadding,
                              ),
                            ),
                          ),
                          // date input field
                          SizedBox(height: kDefaultPadding),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2026),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedDate = value;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kMainColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: kWhite,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Select Date",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: kWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd().format(_selectedDate),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kGrey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding),
                          // time input field
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedTime = DateTime(
                                          _selectedDate.year,
                                          _selectedDate.month,
                                          _selectedDate.day,
                                          value.hour,
                                          value.minute,
                                        );
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kYellow,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.punch_clock_outlined,
                                          color: kWhite,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Select Time",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: kWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.jm().format(_selectedTime),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kGrey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding),
                          Divider(
                            color: kLightGrey.withOpacity(0.5),
                            thickness: 5,
                          ),
                          SizedBox(height: kDefaultPadding),

                          // save button
                          GestureDetector(
                            onTap: () {
                              // save the expense or  the income data into the shared preferences
                            },
                            child: CustomButton(
                              buttonName: "Add",
                              buttonColor: _selectedMethode == 0
                                  ? kRed
                                  : kGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
