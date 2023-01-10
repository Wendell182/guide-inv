import 'package:flutter/material.dart';

class ExchangeTile extends StatelessWidget {
  final int day;
  final String date;
  final double? value;
  final double variationD1;
  final double variationFirstDay;

  const ExchangeTile({
    Key? key,
    required this.day,
    required this.date,
    required this.value,
    required this.variationD1,
    required this.variationFirstDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day.toString().padLeft(2, '0')),
          Text(date),
          Text(value!.toDouble().toStringAsFixed(3)),
          RichText(
            text: TextSpan(
              text: variationD1.toDouble().toStringAsFixed(2) + ' %',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: variationD1.isNegative ? '↓' : '↑',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: variationD1.isNegative
                            ? Colors.red
                            : Colors.green)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: variationD1.toDouble().toStringAsFixed(2) + ' %',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: variationD1.isNegative ? '↓' : '↑',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: variationD1.isNegative
                            ? Colors.red
                            : Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
