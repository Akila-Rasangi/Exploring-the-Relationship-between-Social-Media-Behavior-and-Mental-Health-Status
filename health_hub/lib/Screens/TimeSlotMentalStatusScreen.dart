import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// class TimeSlotMentalStatusScreen extends StatelessWidget {
//   const TimeSlotMentalStatusScreen({super.key});

//   int getCurrentSlot(DateTime now) {
//     final hour = now.hour;
//     if (hour >= 0 && hour < 6) return 0;
//     if (hour >= 6 && hour < 18) return 1;
//     return 2;
//   }

//   int getPreviousSlot(int currentSlot) {
//     return (currentSlot - 1) < 0 ? 2 : currentSlot - 1;
//   }

//   Color getBarColor(double level) {
//     if (level > 0.75) return Colors.red;
//     if (level < 0.5) return Colors.green;
//     return Colors.orange;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final DateTime now = DateTime.now();
//     final int currentSlot = getCurrentSlot(now);
//     final int previousSlot = getPreviousSlot(currentSlot);

//     // Hardcoded Data
//     final Map<int, Map<String, dynamic>> hardcodedData = {
//       0: {
//         'mentalStatus': 'Good 😊',
//         'stressLevel': 0.3,
//         'futureMentalStatus': 'Average 😐',
//       },
//       1: {
//         'mentalStatus': 'Average 😐',
//         'stressLevel': 0.6,
//         'futureMentalStatus': 'Bad 😟',
//       },
//       2: {
//         'mentalStatus': 'Bad 😟',
//         'stressLevel': 0.85,
//         'futureMentalStatus': 'Good 😊',
//       },
//     };

//     final data = hardcodedData[previousSlot]!;
//     final String mentalStatus = data['mentalStatus'];
//     final double stressLevel = data['stressLevel'];
//     final String futureStatus = data['futureMentalStatus'];

//     final List<String> timeSlots = [
//       '00:00 – 06:00',
//       '06:00 – 18:00',
//       '18:00 – 00:00',
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mental Status Overview'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '🕒 Previous Time Slot: ${timeSlots[previousSlot]}',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             const Text('📊 Stress Level:', style: TextStyle(fontSize: 16)),
//             const SizedBox(height: 8),
//             Stack(
//               children: [
//                 Container(
//                   height: 24,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey[300],
//                   ),
//                 ),
//                 Container(
//                   height: 24,
//                   width: MediaQuery.of(context).size.width * stressLevel,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: getBarColor(stressLevel),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             Text(
//               '🧠 Mental Status: $mentalStatus',
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 32),
//             const Divider(thickness: 1),
//             const SizedBox(height: 24),
//             Text(
//               '🔮 Predicted Mental Status (Future Slot: ${timeSlots[currentSlot]}):',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               '➡️ $futureStatus',
//               style: const TextStyle(fontSize: 20),
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const GamesPage()),
//                   );
//                 },
//                 child: const Text('Play Stress-Relieving Game'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Dummy game page
// class GamesPage extends StatelessWidget {
//   const GamesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Stress-Relief Games')),
//       body: const Center(
//         child: Text(
//           '🎮 Mini Games Coming Soon!',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

// +++++++++++++++++++++++++++++ updated with pie chart

// class TimeSlotMentalStatusScreen extends StatelessWidget {
//   const TimeSlotMentalStatusScreen({super.key});

//   int getCurrentSlot(DateTime now) {
//     final hour = now.hour;
//     if (hour >= 0 && hour < 6) return 0;
//     if (hour >= 6 && hour < 18) return 1;
//     return 2;
//   }

//   int getPreviousSlot(int currentSlot) {
//     return (currentSlot - 1) < 0 ? 2 : currentSlot - 1;
//   }

//   Color getBarColor(double level) {
//     if (level > 0.75) return Colors.red;
//     if (level < 0.5) return Colors.green;
//     return Colors.orange;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final DateTime now = DateTime.now();
//     final int currentSlot = getCurrentSlot(now);
//     final int previousSlot = getPreviousSlot(currentSlot);

//     final Map<int, Map<String, dynamic>> hardcodedData = {
//       0: {
//         'mentalStatus': 'Good 😊',
//         'stressLevel': 0.3,
//         'futureMentalStatus': 'Average 😐',
//       },
//       1: {
//         'mentalStatus': 'Average 😐',
//         'stressLevel': 0.6,
//         'futureMentalStatus': 'Bad 😟',
//       },
//       2: {
//         'mentalStatus': 'Bad 😟',
//         'stressLevel': 0.85,
//         'futureMentalStatus': 'Good 😊',
//       },
//     };

//     final data = hardcodedData[previousSlot]!;
//     final String mentalStatus = data['mentalStatus'];
//     final double stressLevel = data['stressLevel'];
//     final String futureStatus = data['futureMentalStatus'];

//     final List<String> timeSlots = [
//       '00:00 – 06:00',
//       '06:00 – 18:00',
//       '18:00 – 00:00',
//     ];

//     // Pie chart data
//     final Map<String, double> stressData = {
//       timeSlots[0]: hardcodedData[0]!['stressLevel'],
//       timeSlots[1]: hardcodedData[1]!['stressLevel'],
//       timeSlots[2]: hardcodedData[2]!['stressLevel'],
//     };

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mental Status Overview'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '🕒 Previous Time Slot: ${timeSlots[previousSlot]}',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             const Text('📊 Stress Level:', style: TextStyle(fontSize: 16)),
//             const SizedBox(height: 8),
//             Stack(
//               children: [
//                 Container(
//                   height: 24,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey[300],
//                   ),
//                 ),
//                 Container(
//                   height: 24,
//                   width: MediaQuery.of(context).size.width * stressLevel,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: getBarColor(stressLevel),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             Text(
//               '🧠 Mental Status: $mentalStatus',
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 32),
//             const Divider(thickness: 1),
//             const SizedBox(height: 24),
//             Text(
//               '🔮 Predicted Mental Status (Current Slot: ${timeSlots[currentSlot]}):',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               '➡️ $futureStatus',
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 32),
//             const Text(
//               '📈 Stress Distribution for All Time Slots:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 12),
//             PieChart(
//               dataMap: stressData,
//               chartRadius: MediaQuery.of(context).size.width / 2.2,
//               colorList: [
//                 Colors.green,
//                 Colors.orange,
//                 Colors.red,
//               ],
//               chartType: ChartType.disc,
//               chartValuesOptions: const ChartValuesOptions(
//                 showChartValuesInPercentage: true,
//                 showChartValuesOutside: true,
//               ),
//               legendOptions: const LegendOptions(
//                 legendPosition: LegendPosition.right,
//               ),
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const GamesPage()),
//                   );
//                 },
//                 child: const Text('Play Stress-Relieving Game'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class GamesPage extends StatelessWidget {
//   const GamesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Stress-Relief Games')),
//       body: const Center(
//         child: Text(
//           '🎮 Mini Games Coming Soon!',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

// +++++++++++++++++++++++++++++++ add somme styles and colors

class TimeSlotMentalStatusScreen extends StatelessWidget {
  const TimeSlotMentalStatusScreen({super.key});

  int getCurrentSlot(DateTime now) {
    final hour = now.hour;
    if (hour >= 0 && hour < 6) return 0;
    if (hour >= 6 && hour < 18) return 1;
    return 2;
  }

  int getPreviousSlot(int currentSlot) {
    return (currentSlot - 1) < 0 ? 2 : currentSlot - 1;
  }

  Color getBarColor(double level) {
    if (level > 0.75) return Colors.redAccent.shade100;
    if (level < 0.5) return Colors.greenAccent.shade200;
    return Colors.orangeAccent;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int currentSlot = getCurrentSlot(now);
    final int previousSlot = getPreviousSlot(currentSlot);

    final Map<int, Map<String, dynamic>> hardcodedData = {
      0: {
        'mentalStatus': 'Good 😊',
        'stressLevel': 0.3,
        'futureMentalStatus': 'Average 😐',
      },
      1: {
        'mentalStatus': 'Average 😐',
        'stressLevel': 0.6,
        'futureMentalStatus': 'Bad 😟',
      },
      2: {
        'mentalStatus': 'Bad 😟',
        'stressLevel': 0.85,
        'futureMentalStatus': 'Good 😊',
      },
    };

    final data = hardcodedData[previousSlot]!;
    final String mentalStatus = data['mentalStatus'];
    final double stressLevel = data['stressLevel'];
    final String futureStatus = data['futureMentalStatus'];

    final List<String> timeSlots = [
      '00:00 – 06:00',
      '06:00 – 18:00',
      '18:00 – 00:00',
    ];

    final Map<String, double> stressData = {
      timeSlots[0]: hardcodedData[0]!['stressLevel'],
      timeSlots[1]: hardcodedData[1]!['stressLevel'],
      timeSlots[2]: hardcodedData[2]!['stressLevel'],
    };

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('🧠 Mental Status Overview', style: TextStyle(color: Colors.white)),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Text(
              '🕒 Previous Time Slot: ${timeSlots[previousSlot]}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
            ),
            const SizedBox(height: 16),
            const Text('📊 Stress Level:', style: TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  height: 24,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white24,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 24,
                  width: MediaQuery.of(context).size.width * stressLevel,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: getBarColor(stressLevel),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '🧠 Mental Status: $mentalStatus',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.cyanAccent),
            ),
            const SizedBox(height: 32),
            const Divider(color: Colors.white38, thickness: 1),
            const SizedBox(height: 24),
            Text(
              '🔮 Predicted Mental Status (Current Slot: ${timeSlots[currentSlot]}):',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              '➡️ $futureStatus',
              style: const TextStyle(fontSize: 20, color: Colors.amberAccent),
            ),
            const SizedBox(height: 32),
            const Text(
              '📈 Stress Distribution for All Time Slots:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 12),
            PieChart(
              dataMap: stressData,
              chartRadius: MediaQuery.of(context).size.width / 2.2,
              colorList: [Colors.greenAccent, Colors.orangeAccent, Colors.redAccent],
              chartType: ChartType.disc,
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1,
                chartValueStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              legendOptions: const LegendOptions(
                legendTextStyle: TextStyle(color: Colors.white70),
                legendPosition: LegendPosition.right,
              ),
            ),
            const Spacer(),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const GamesPage()),
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Colors.cyanAccent, Colors.lightBlueAccent],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.6),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Text(
                    '🎮 Play Stress-Relieving Game',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1F2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Stress-Relief Games', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          '🎮 Mini Games Coming Soon!',
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ),
    );
  }
}


