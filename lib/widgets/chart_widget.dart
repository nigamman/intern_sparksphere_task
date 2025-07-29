import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartWidget extends StatelessWidget {
  final List<double> yValues;
  final List<String> xLabels;
  final bool showAxes;
  final double fontSize;

  const ChartWidget({
    super.key,
    required this.yValues,
    required this.xLabels,
    this.showAxes = true,
    this.fontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: showAxes,
              reservedSize: 32,
              interval: 2000,
              getTitlesWidget: (value, _) {
                if (value == 0) {
                  return Text(
                    '0',
                    style: TextStyle(color: Colors.grey, fontSize: fontSize),
                  );
                } else {
                  return Text(
                    '${(value ~/ 1000)}k',
                    style: TextStyle(color: Colors.grey, fontSize: fontSize),
                  );
                }
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: showAxes,
              interval: 1,
              getTitlesWidget: (value, _) {
                int i = value.toInt();
                return i >= 0 && i < xLabels.length
                    ? Text(
                  xLabels[i],
                  style: TextStyle(color: Colors.grey, fontSize: fontSize),
                )
                    : const SizedBox();
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        minY: 0,
        maxY: (yValues.reduce((a, b) => a > b ? a : b) / 1000).ceil() * 1000,
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            color: Colors.blue,
            spots: List.generate(
              yValues.length,
                  (i) => FlSpot(i.toDouble(), yValues[i]),
            ),
          ),
        ],
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}