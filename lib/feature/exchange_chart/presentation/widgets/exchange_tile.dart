import 'package:flutter/material.dart';

class ExchangeTile extends StatelessWidget {
  final String day;
  final String date;
  final double? value;
  final String variationD1;
  final String variationFirstDay;

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(day),
        Text(date),
        Text(value.toString()),
        Text(variationD1),
        Text(variationFirstDay),
      ],
    );
  }
}
