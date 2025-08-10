// ignore_for_file: deprecated_member_use

import 'package:expenzes_trng/utils/colors.dart';
import 'package:expenzes_trng/utils/constants.dart';
import 'package:flutter/material.dart';

class IncomeExpenceCard extends StatefulWidget {
  final String title;
  final double amount;
  final String imageUrl;
  final Color bgColor;
  const IncomeExpenceCard({
    super.key,
    required this.title,
    required this.amount,
    required this.imageUrl,
    required this.bgColor,
  });

  @override
  State<IncomeExpenceCard> createState() => _IncomeExpenceCardState();
}

class _IncomeExpenceCardState extends State<IncomeExpenceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,

              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Image.asset(widget.imageUrl, width: 70)),
            ),
            const SizedBox(width: kDefaultPadding / 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, color: kWhite),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Text(
                  "\$${widget.amount.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
