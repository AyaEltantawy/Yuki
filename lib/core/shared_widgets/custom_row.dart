import 'package:flutter/material.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final double amount;

  const CustomRow({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: title == "Total Price"
              ? TextStyles.font15Mainblue700Weight
              : TextStyles.font15Icongrey400Weight,
        ),
        Text(
          "$amount",
          style: title == "Total Price"
              ? TextStyles.font15Mainblue700Weight
              : TextStyles.font15Black400Weight,
        )
      ],
    );
  }
}
