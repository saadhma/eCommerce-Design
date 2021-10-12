import 'dart:io';

import 'package:ecommerce_design/screens/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'E-Shop',
            home: UserHomeScreen(),
          );
        }
    );
  }
}

// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';
//
// // Sets a platform override for desktop to avoid exceptions. See
// // https://flutter.dev/desktop#target-platform-override for more info.
// void enablePlatformOverrideForDesktop() {
//   if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
//     debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//   }
// }
//
// void main() {
//   enablePlatformOverrideForDesktop();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Pie Chart Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//         brightness: Brightness.dark,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//
// enum LegendShape { Circle, Rectangle }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   Map<String, double> dataMap = {
//     "Flutter": 5,
//     "React": 3,
//     "Xamarin": 2,
//     "Ionic": 2,
//   };
//   List<Color> colorList = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.yellow,
//   ];
//
//   ChartType? _chartType = ChartType.disc;
//   bool _showCenterText = true;
//   double? _ringStrokeWidth = 32;
//   double? _chartLegendSpacing = 32;
//
//   bool _showLegendsInRow = false;
//   bool _showLegends = true;
//
//   bool _showChartValueBackground = true;
//   bool _showChartValues = true;
//   bool _showChartValuesInPercentage = false;
//   bool _showChartValuesOutside = false;
//
//   LegendShape? _legendShape = LegendShape.Circle;
//   LegendPosition? _legendPosition = LegendPosition.right;
//
//   int key = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final chart = PieChart(
//       key: ValueKey(key),
//       dataMap: dataMap,
//       animationDuration: const Duration(milliseconds: 800),
//       chartLegendSpacing: _chartLegendSpacing!,
//       chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
//           ? 300
//           : MediaQuery.of(context).size.width / 3.2,
//       colorList: colorList,
//       initialAngleInDegree: 0,
//       chartType: _chartType!,
//       centerText: _showCenterText ? "HYBRID APP DEVELOPMENT" : null,
//       legendOptions: LegendOptions(
//         showLegendsInRow: _showLegendsInRow,
//         legendPosition: _legendPosition!,
//         showLegends: _showLegends,
//         legendShape: _legendShape == LegendShape.Circle
//             ? BoxShape.circle
//             : BoxShape.rectangle,
//         legendTextStyle: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       chartValuesOptions: ChartValuesOptions(
//         showChartValueBackground: _showChartValueBackground,
//         showChartValues: _showChartValues,
//         showChartValuesInPercentage: _showChartValuesInPercentage,
//         showChartValuesOutside: _showChartValuesOutside,
//       ),
//       ringStrokeWidth: _ringStrokeWidth!,
//       emptyColor: Colors.grey,
//     );
//     final settings = SingleChildScrollView(
//       child: Card(
//         margin: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text(
//                 'Pie Chart Options'.toUpperCase(),
//                 style: Theme.of(context).textTheme.overline!.copyWith(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: const Text("chartType"),
//               trailing: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: DropdownButton<ChartType>(
//                   value: _chartType,
//                   items: const [
//                     DropdownMenuItem(
//                       child: Text("disc"),
//                       value: ChartType.disc,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("ring"),
//                       value: ChartType.ring,
//                     ),
//                   ],
//                   onChanged: (val) {
//                     setState(() {
//                       _chartType = val;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             ListTile(
//               title: const Text("ringStrokeWidth"),
//               trailing: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: DropdownButton<double>(
//                   value: _ringStrokeWidth,
//                   disabledHint: const Text("select chartType.ring"),
//                   items: const [
//                     DropdownMenuItem(
//                       child: Text("16"),
//                       value: 16,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("32"),
//                       value: 32,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("48"),
//                       value: 48,
//                     ),
//                   ],
//                   onChanged: (_chartType == ChartType.ring)
//                       ? (val) {
//                     setState(() {
//                       _ringStrokeWidth = val;
//                     });
//                   }
//                       : null,
//                 ),
//               ),
//             ),
//             SwitchListTile(
//               value: _showCenterText,
//               title: const Text("showCenterText"),
//               onChanged: (val) {
//                 setState(() {
//                   _showCenterText = val;
//                 });
//               },
//             ),
//             ListTile(
//               title: const Text("chartLegendSpacing"),
//               trailing: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: DropdownButton<double>(
//                   value: _chartLegendSpacing,
//                   disabledHint: const Text("select chartType.ring"),
//                   items: const [
//                     DropdownMenuItem(
//                       child: Text("16"),
//                       value: 16,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("32"),
//                       value: 32,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("48"),
//                       value: 48,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("64"),
//                       value: 64,
//                     ),
//                   ],
//                   onChanged: (val) {
//                     setState(() {
//                       _chartLegendSpacing = val;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Legend Options'.toUpperCase(),
//                 style: Theme.of(context).textTheme.overline!.copyWith(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SwitchListTile(
//               value: _showLegendsInRow,
//               title: const Text("showLegendsInRow"),
//               onChanged: (val) {
//                 setState(() {
//                   _showLegendsInRow = val;
//                 });
//               },
//             ),
//             SwitchListTile(
//               value: _showLegends,
//               title: const Text("showLegends"),
//               onChanged: (val) {
//                 setState(() {
//                   _showLegends = val;
//                 });
//               },
//             ),
//             ListTile(
//               title: const Text("legendShape"),
//               trailing: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: DropdownButton<LegendShape>(
//                   value: _legendShape,
//                   items: const [
//                     DropdownMenuItem(
//                       child: Text("BoxShape.circle"),
//                       value: LegendShape.Circle,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("BoxShape.rectangle"),
//                       value: LegendShape.Rectangle,
//                     ),
//                   ],
//                   onChanged: (val) {
//                     setState(() {
//                       _legendShape = val;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             ListTile(
//               title: const Text("legendPosition"),
//               trailing: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: DropdownButton<LegendPosition>(
//                   value: _legendPosition,
//                   items: const [
//                     DropdownMenuItem(
//                       child: Text("left"),
//                       value: LegendPosition.left,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("right"),
//                       value: LegendPosition.right,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("top"),
//                       value: LegendPosition.top,
//                     ),
//                     DropdownMenuItem(
//                       child: Text("bottom"),
//                       value: LegendPosition.bottom,
//                     ),
//                   ],
//                   onChanged: (val) {
//                     setState(() {
//                       _legendPosition = val;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Chart values Options'.toUpperCase(),
//                 style: Theme.of(context).textTheme.overline!.copyWith(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SwitchListTile(
//               value: _showChartValueBackground,
//               title: const Text("showChartValueBackground"),
//               onChanged: (val) {
//                 setState(() {
//                   _showChartValueBackground = val;
//                 });
//               },
//             ),
//             SwitchListTile(
//               value: _showChartValues,
//               title: const Text("showChartValues"),
//               onChanged: (val) {
//                 setState(() {
//                   _showChartValues = val;
//                 });
//               },
//             ),
//             SwitchListTile(
//               value: _showChartValuesInPercentage,
//               title: const Text("showChartValuesInPercentage"),
//               onChanged: (val) {
//                 setState(() {
//                   _showChartValuesInPercentage = val;
//                 });
//               },
//             ),
//             SwitchListTile(
//               value: _showChartValuesOutside,
//               title: const Text("showChartValuesOutside"),
//               onChanged: (val) {
//                 setState(() {
//                   _showChartValuesOutside = val;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Pie Chart App Development"),
//         actions: [
//           RaisedButton(
//             onPressed: () {
//               setState(() {
//                 key = key + 1;
//               });
//             },
//             child: Text("Reload".toUpperCase()),
//           ),
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (_, constraints) {
//           if (constraints.maxWidth >= 600) {
//             return Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Flexible(
//                   flex: 2,
//                   fit: FlexFit.tight,
//                   child: chart,
//                 ),
//                 Flexible(
//                   flex: 1,
//                   child: settings,
//                 )
//               ],
//             );
//           } else {
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     child: chart,
//                     margin: const EdgeInsets.symmetric(
//                       vertical: 32,
//                     ),
//                   ),
//                   settings,
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }