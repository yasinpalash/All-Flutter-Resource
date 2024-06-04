import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200], // Background color to match the card
        body: Center(
          child: AttendanceCard(),
        ),
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Attendance',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          CircularChart(),
          SizedBox(height: 16),
          AttendanceInfo(title: 'Students', percentage: 84),
          SizedBox(height: 8),
          AttendanceInfo(title: 'Teachers', percentage: 91),
        ],
      ),
    );
  }
}

class CircularChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Adjust height as needed
      child: Stack(
        alignment: Alignment.center,
        children: [
          SfCircularChart(
            series: <CircularSeries>[
              RadialBarSeries<ChartData, String>(
                dataSource: [
                  ChartData('Students', 84),
                  ChartData('Teachers', 91),
                ],
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointRadiusMapper: (ChartData data, _) => '${data.y}%',
                maximumValue: 100,
                innerRadius: '70%',
                radius: '100%',
                gap: '3%',
                cornerStyle: CornerStyle.bothCurve,
                trackColor: Colors.grey[200] ?? Colors.grey,
                trackBorderWidth: 0,
                dataLabelSettings: DataLabelSettings(isVisible: false),
                pointColorMapper: (ChartData data, _) => data.x == 'Students'
                    ? Colors.blue
                    : Colors.orange,
              ),
            ],
          ),
          Center(
            child: Icon(
              Icons.group,
              size: 32,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}

class AttendanceInfo extends StatelessWidget {
  final String title;
  final int percentage;

  AttendanceInfo({required this.title, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        Text(
          '$percentage%',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
