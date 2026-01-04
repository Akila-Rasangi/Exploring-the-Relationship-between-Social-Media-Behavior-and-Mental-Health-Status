import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Category Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TimeCalculatorPage(),
    );
  }
}

class TimeCalculatorPage extends StatefulWidget {
  @override
  _TimeCalculatorPageState createState() => _TimeCalculatorPageState();
}

class _TimeCalculatorPageState extends State<TimeCalculatorPage> {
  TimeOfDay? loginTime;
  TimeOfDay? logoutTime;

  Duration nightDuration = Duration.zero;
  Duration dayDuration = Duration.zero;
  Duration eveningDuration = Duration.zero;
  Duration totalDuration = Duration.zero;

  //final DateFormat _formatter = DateFormat("HH:mm:ss");

  Future<void> _pickTime(BuildContext context, bool isLogin) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isLogin) {
          loginTime = picked;
        } else {
          logoutTime = picked;
        }
      });
    }
  }

  void _calculateDurations() {
    if (loginTime == null || logoutTime == null) return;

    DateTime today = DateTime.now();
    DateTime loginDateTime = DateTime(today.year, today.month, today.day, loginTime!.hour, loginTime!.minute);
    DateTime logoutDateTime = DateTime(today.year, today.month, today.day, logoutTime!.hour, logoutTime!.minute);

    if (logoutDateTime.isBefore(loginDateTime)) {
      logoutDateTime = logoutDateTime.add(Duration(days: 1)); // cross midnight
    }

    Duration total = logoutDateTime.difference(loginDateTime);
    Duration night = Duration.zero;
    Duration day = Duration.zero;
    Duration evening = Duration.zero;

    DateTime current = loginDateTime;
    while (current.isBefore(logoutDateTime)) {
      DateTime next = current.add(Duration(minutes: 1));
      int hour = current.hour;

      if (hour < 6) {
        night += Duration(minutes: 1);
      } else if (hour < 18) {
        day += Duration(minutes: 1);
      } else {
        evening += Duration(minutes: 1);
      }
      current = next;
    }

    setState(() {
      nightDuration = night;
      dayDuration = day;
      eveningDuration = evening;
      totalDuration = total;
    });
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Category Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => _pickTime(context, true),
                child: Text(loginTime == null ? "Select Login Time" : "Login: ${loginTime!.format(context)}"),
              ),
              ElevatedButton(
                onPressed: () => _pickTime(context, false),
                child: Text(logoutTime == null ? "Select Logout Time" : "Logout: ${logoutTime!.format(context)}"),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateDurations,
            child: Text("Calculate Durations"),
          ),
          SizedBox(height: 20),
          if (totalDuration.inSeconds > 0) ...[
            Text("Total Duration: ${_formatDuration(totalDuration)}"),
            Text("Night (00:00–06:00): ${_formatDuration(nightDuration)}"),
            Text("Day (06:00–18:00): ${_formatDuration(dayDuration)}"),
            Text("Evening (18:00–24:00): ${_formatDuration(eveningDuration)}"),
          ]
        ]),
      ),
    );
  }
}
