// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[200], // Background color to match the card
//         body: Center(
//           child: AttendanceCard(),
//         ),
//       ),
//     );
//   }
// }
//
// class AttendanceCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 180,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Attendance',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 16),
//           CircularChart(),
//           SizedBox(height: 16),
//           AttendanceInfo(title: 'Students', percentage: 84),
//           SizedBox(height: 8),
//           AttendanceInfo(title: 'Teachers', percentage: 91),
//         ],
//       ),
//     );
//   }
// }
//
// class CircularChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120, // Adjust height as needed
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           SfCircularChart(
//             series: <CircularSeries>[
//               RadialBarSeries<ChartData, String>(
//                 dataSource: [
//                   ChartData('Students', 84),
//                   ChartData('Teachers', 91),
//                 ],
//                 xValueMapper: (ChartData data, _) => data.x,
//                 yValueMapper: (ChartData data, _) => data.y,
//                 pointRadiusMapper: (ChartData data, _) => '${data.y}%',
//                 maximumValue: 100,
//                 innerRadius: '70%',
//                 radius: '100%',
//                 gap: '3%',
//                 cornerStyle: CornerStyle.bothCurve,
//                 trackColor: Colors.grey[200] ?? Colors.grey,
//                 trackBorderWidth: 0,
//                 dataLabelSettings: DataLabelSettings(isVisible: false),
//                 pointColorMapper: (ChartData data, _) => data.x == 'Students'
//                     ? Colors.blue
//                     : Colors.orange,
//               ),
//             ],
//           ),
//           Center(
//             child: Icon(
//               Icons.group,
//               size: 32,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ChartData {
//   final String x;
//   final double y;
//
//   ChartData(this.x, this.y);
// }
//
// class AttendanceInfo extends StatelessWidget {
//   final String title;
//   final int percentage;
//
//   AttendanceInfo({required this.title, required this.percentage});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black54,
//           ),
//         ),
//         Text(
//           '$percentage%',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Jun 2024'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.filter_alt),
//               onPressed: () {
//                 // Add filter functionality here
//               },
//             ),
//           ],
//         ),
//         body: ExpenseChart(),
//       ),
//     );
//   }
// }
//
// class ExpenseChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               CircularChart(
//                 title: 'Income',
//                 percentage: 38,
//                 amount: 588,
//                 color: Colors.blue,
//               ),
//               CircularChart(
//                 title: 'Expenses',
//                 percentage: 50,
//                 amount: 55,
//                 color: Colors.red,
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text('Total \$533.00', style: TextStyle(fontSize: 18)),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView(
//               children: [
//                 CheckboxListTile(
//                   title: Text('All'),
//                   value: true,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Text('Food'),
//                   value: false,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Text('Social Life'),
//                   value: false,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Text('Pets'),
//                   value: false,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Transport'),
//                       Text('\$55.00'),
//                     ],
//                   ),
//                   value: true,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Text('Culture'),
//                   value: false,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Text('Household'),
//                   value: false,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Text('Apparel'),
//                   value: false,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Text('Beauty'),
//                   value: false,
//                   onChanged: (bool? value) {},
//                 ),
//                 CheckboxListTile(
//                   title: Text('Health'),
//                   value: false,
//                   onChanged: (bool? value) {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CircularChart extends StatelessWidget {
//   final String title;
//   final int percentage;
//   final double amount;
//   final Color color;
//
//   CircularChart({
//     required this.title,
//     required this.percentage,
//     required this.amount,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           height: 150,
//           width: 150,
//           child: SfCircularChart(
//             series: <CircularSeries>[
//               DoughnutSeries<ChartData, String>(
//                 dataSource: [
//                   ChartData('Used', percentage, color),
//                   ChartData('Remaining', 100 - percentage, Colors.grey[300]!),
//                 ],
//                 pointColorMapper: (ChartData data, _) => data.color,
//                 xValueMapper: (ChartData data, _) => data.x,
//                 yValueMapper: (ChartData data, _) => data.y,
//                 innerRadius: '75%',
//               ),
//             ],
//           ),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('$percentage%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             Text('\$$amount', style: TextStyle(fontSize: 16)),
//             Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class ChartData {
//   ChartData(this.x, this.y, this.color);
//   final String x;
//   final int y;
//   final Color color;
// }
