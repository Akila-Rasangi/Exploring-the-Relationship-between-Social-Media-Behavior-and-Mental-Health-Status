import 'package:flutter/material.dart';
import 'dart:async';

// class DisplayStatusScreen extends StatelessWidget {
//   final double stressLevel; // Value from 0.0 to 1.0 (e.g., 0.6 = 60%)

//   const DisplayStatusScreen({super.key, required this.stressLevel});

//   Color getBarColor() {
//     if (stressLevel > 0.75) {
//       return Colors.red;
//     } else if (stressLevel < 0.5) {
//       return Colors.green;
//     } else {
//       return Colors.orange;
//     }
//   }

//   String getMentalStatusText() {
//     if (stressLevel > 0.75) {
//       return 'Your mental health is: Bad 😟';
//     } else if (stressLevel < 0.5) {
//       return 'Your mental health is: Good 😊';
//     } else {
//       return 'Your mental health is: Average 😐';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final barColor = getBarColor();
//     final statusText = getMentalStatusText();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mental Health Status'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Stress Level',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
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
//                     color: barColor,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 32),
//             Text(
//               statusText,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 48),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => const GamesPage()),
//                 );
//               },
//               child: const Text('Go to Games Page'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Dummy GamesPage for navigation
// class GamesPage extends StatelessWidget {
//   const GamesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Games for Mental Health'),
//       ),
//       body: const Center(
//         child: Text(
//           'Games Page Coming Soon...',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++updated ui


class DisplayStatusScreen extends StatefulWidget {
  final double stressLevel; // Value from 0.0 to 1.0

  const DisplayStatusScreen({super.key, required this.stressLevel});

  @override
  State<DisplayStatusScreen> createState() => _DisplayStatusScreenState();
}

class _DisplayStatusScreenState extends State<DisplayStatusScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showResult = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    // Delay result display for 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      _controller.stop();
      setState(() {
        _showResult = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color getBarColor() {
    if (widget.stressLevel > 0.75) {
      return Colors.red;
    } else if (widget.stressLevel < 0.5) {
      return Colors.green;
    } else {
      return Colors.orange;
    }
  }

  String getMentalStatusText() {
    if (widget.stressLevel > 0.75) {
      return 'Your mental health is: Bad 😟';
    } else if (widget.stressLevel < 0.5) {
      return 'Your mental health is: Good 😊';
    } else {
      return 'Your mental health is: Average 😐';
    }
  }

  Widget _buildAnimatedLoader() {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: const Text(
          '🔄',
          style: TextStyle(fontSize: 64),
        ),
      ),
    );
  }

  Widget _buildResultUI() {
    final barColor = getBarColor();
    final statusText = getMentalStatusText();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Stress Level',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 24,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                ),
              ),
              Container(
                height: 24,
                width: MediaQuery.of(context).size.width * widget.stressLevel,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: barColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            statusText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GamesPage()),
              );
            },
            child: const Text('Go to Games Page'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Status'),
      ),
      body: Center(
        child: _showResult ? _buildResultUI() : _buildAnimatedLoader(),
      ),
    );
  }
}

// Dummy GamesPage for navigation
class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games for Mental Health'),
      ),
      body: const Center(
        child: Text(
          'Games Page Coming Soon...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

