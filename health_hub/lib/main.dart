import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_hub/Screens/LoginScreen.dart';
import 'package:health_hub/Screens/MainDashboard.dart';
import 'package:health_hub/Screens/TermsAndConditions.dart';
import 'package:shared_preferences/shared_preferences.dart';


// import 'firebase_options.dart'; // Use flutterfire CLI to generate this

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//   runApp(MyApp(isLoggedIn: isLoggedIn));
// }

// class MyApp extends StatelessWidget {
//   final bool isLoggedIn;
//   const MyApp({required this.isLoggedIn, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Social Auth App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: isLoggedIn ? const Maindashboard() : const LoginScreen(),
//     );
//   }
// }



// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool termsAccepted = prefs.getBool('termsAccepted') ?? false;

  runApp(MyApp(showDashboard: termsAccepted));
}

class MyApp extends StatelessWidget {
  final bool showDashboard;
  const MyApp({super.key, required this.showDashboard});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Terms App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: showDashboard ? const Maindashboard() : const TermsAndConditions(),
    );
  }
}
