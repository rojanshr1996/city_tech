import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_city_project/model/ticket_model.dart';
import 'package:new_city_project/utils/res/app_colors.dart';

class Chart extends StatefulWidget {
  final List<String> keys;
  final TicketModel data;
  const Chart({super.key, required this.keys, required this.data});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

   Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(fontSize: 10, color: AppColors.dart);
    String text;
    switch (value.toInt()) {
      case 0:
        text = widget.data.data.dist.day[1].toString();
        break;
      case 1:
                text = widget.data.data.dist.day[2].toString();

        break;
      case 2:
               text = widget.data.data.dist.day[3].toString();

        break;
      case 3:
              text = widget.data.data.dist.day[4].toString();

        break;
    
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    TextStyle style = TextStyle(
      fontSize: 10,
      color: AppColors.dart
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 400;
            final barsWidth = 8.0 * constraints.maxWidth / 400;
            return BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),),);
          }))); 
  }
}