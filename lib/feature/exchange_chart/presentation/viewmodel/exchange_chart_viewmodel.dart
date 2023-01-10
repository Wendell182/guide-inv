import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/formatter/formatter.dart';

class ExchangeChartViewmodel {
  ExchangeChartViewmodel();

  List<FlSpot> chartData = [];
  double maxX = 0;
  double maxY = 0;
  double minY = 0;

  LineChartData getChartData(
      {required List<double?> quotes, required List<int>? dates}) {
    maxX = quotes.length.toDouble();
    maxY = 0;
    minY = double.infinity;

    for (var item in quotes) {
      maxY = item! > maxY ? item : maxY;
      minY = item < minY ? item : minY;
    }

    for (int i = 0; i < quotes.length; i++) {
      chartData.add(FlSpot(
        i.toDouble(),
        quotes[i]!,
      ));
    }

    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: chartData,
          isCurved: true,
          gradient: const LinearGradient(colors: Constants.gradientColors),
          barWidth: 2,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: const Color(0xFF343434),
          getTooltipItems: (data) {
            return data.map((item) {
              final date = parseDateWithTime(dates![item.spotIndex]);
              return LineTooltipItem(
                item.y.toStringAsFixed(2),
                const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: '\n $date',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(.5),
                    ),
                  ),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
