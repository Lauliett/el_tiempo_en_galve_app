import 'package:el_tiempo_en_galve_app/features/historicalData/domain/entities/historical_agroup_year.dart';
import 'package:el_tiempo_en_galve_app/features/historicalData/domain/entities/historical_data_month.dart';
import 'package:el_tiempo_en_galve_app/features/shared/widgets/line_chart_slide_horizontal_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Widget> rainYearSection(ThemeData theme, HistoricalAgroupYear historicalAgroupYear) {
  List<HistoricalDataMonth> historicalDataMonthList = historicalAgroupYear.historicalDataMonth;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String formattedValueString = value.toStringAsFixed(1);
    double? formattedValue = double.tryParse(formattedValueString); // Formatea el valor a 1 decimal
    if (formattedValue != null && formattedValue % 1 == 0) {
      int month = formattedValue.toInt();
      String monthString = "";

      if(month == 1){
        monthString = "ENE";
      }else if(month == 2){
        monthString = "FEB";
      }else if(month == 3){
        monthString = "MAR";
      }else if(month == 4){
        monthString = "ABR";
      }else if(month == 5){
        monthString = "MAY";
      }else if(month == 6){
        monthString = "JUN";
      }else if(month == 7){
        monthString = "JUL";
      }else if(month == 8){
        monthString = "AGO";
      }else if(month == 9){
        monthString = "SEP";
      }else if(month == 10){
        monthString = "OCT";
      }else if(month == 11){
        monthString = "NOV";
      }else{
        monthString = "DIC";
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(monthString),
      );
    } else {
      return Container(); // No muestra ningún widget si el valor no es un entero
    }
  }


  return [
    Text("Lluvia", style: theme.textTheme.titleLarge),
    const SizedBox(height: 10,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Acumulada del año: ${historicalAgroupYear.totalRain} mm "),
        Text("Mes más lluvioso: ${historicalAgroupYear.maxRain.value}mm/h  -Mes: ${historicalAgroupYear.maxTemp.day}"),
        const SizedBox(height: 20,),
      ],
    ),
    LineChartSlideHorizontalWidget(
      chartData: historicalDataMonthList.map((e) => ChartData(e.month.toDouble(), e.acumulateDailyraininmm.toDouble())).toList(),
      chartDataColor: Colors.blue,
      bottomTitleWidget: bottomTitleWidgets,
      maxX: historicalDataMonthList[historicalDataMonthList.length -1].month.toDouble() + 2,
      maxXShow: historicalDataMonthList.length > 10 
        ? historicalDataMonthList[10].month.toDouble() 
        : historicalDataMonthList[historicalDataMonthList.length -1].month.toDouble(),
      minX: historicalDataMonthList[0].month.toDouble(),
      )
  ];
}
