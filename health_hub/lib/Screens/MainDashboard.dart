import 'package:flutter/material.dart';
import 'package:health_hub/Screens/DisplayStatusScreen.dart';
import 'package:health_hub/Screens/LoginScreen.dart';
import 'package:health_hub/Screens/TimeSlotMentalStatusScreen.dart';
import 'package:health_hub/Screens/WebViewScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

// class SessionTracker {
//   static Future<void> trackClick(String platform) async {
//     final now = DateTime.now().toIso8601String();
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString("last_${platform}_click", now);
//     debugPrint("[$platform] click time saved: $now");
//   }
// }

// class Maindashboard extends StatelessWidget {
//   const Maindashboard({super.key});

//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', false);

//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => LoginScreen()),
//         (route) => false);
//   }

// void _handleSocialClick(BuildContext context, String url, String platform) {
//   SessionTracker.trackClick(platform);
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => WebViewScreen(url: url, platform: platform),
//     ),
//   );
// }

// Future<void> _openInAppBrowser(String url, String platform) async {
//   SessionTracker.trackClick(platform);
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Main Dashboard"),
//         actions: [
//           IconButton(onPressed: () => logout(context), icon: const Icon(Icons.logout))
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // children: [
//           //   ElevatedButton(onPressed: () {}, child: const Text("Facebook")),
//           //   ElevatedButton(onPressed: () {}, child: const Text("Twitter")),
//           //   ElevatedButton(onPressed: () {}, child: const Text("Instagram")),
//           // ],
//           children: [
//           ElevatedButton(
//             onPressed: () => _handleSocialClick(context, "https://www.facebook.com/yourPage", "Facebook"),
//             child: const Text("Facebook"),
//           ),
//           ElevatedButton(
//             onPressed: () => _handleSocialClick(context, "https://twitter.com/yourProfile", "Twitter"),
//             child: const Text("Twitter"),
//           ),
//           ElevatedButton(
//             onPressed: () => _handleSocialClick(context, "https://www.instagram.com/yourProfile", "Instagram"),
//             child: const Text("Instagram"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const DisplayStatusScreen(stressLevel: 65.0)),
//               );
//             },
//             child: const Text("Check Mental Health Status"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const TimeSlotMentalStatusScreen()),
//               );
//             },
//             child: const Text("Check Mental Health Status"),
//           ),
//           // ElevatedButton(
//           //   onPressed: () => _openInAppBrowser("https://www.facebook.com", "Facebook"),
//           //   child: const Text("Facebook"),
//           // ),
//           // ElevatedButton(
//           //   onPressed: () => _openInAppBrowser("https://www.instagram.com", "Instagram"),
//           //   child: const Text("Instagram"),
//           // ),
//         ],
//         ),
//       ),
//     );
//   }
// }

// +++++++++++++++++++++++++++++++++++++++++ updated with styles

class SessionTracker {
  static Future<void> trackClick(String platform) async {
    final now = DateTime.now().toIso8601String();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("last_${platform}_click", now);
    debugPrint("[$platform] click time saved: $now");
  }
}

class Maindashboard extends StatelessWidget {
  const Maindashboard({super.key});

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
  }

  void _handleSocialClick(BuildContext context, String url, String platform) {
    SessionTracker.trackClick(platform);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: url, platform: platform),
      ),
    );
  }

  Future<void> _openInAppBrowser(String url, String platform) async {
    SessionTracker.trackClick(platform);
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  Widget buildStyledButton(BuildContext context, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.lightBlue.withOpacity(0.3),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F2FF), // Very light blue
      appBar: AppBar(
        title: const Text("Main Dashboard"),
        backgroundColor: Colors.blue[300],
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: [
          //   ElevatedButton(onPressed: () {}, child: const Text("Facebook")),
          //   ElevatedButton(onPressed: () {}, child: const Text("Twitter")),
          //   ElevatedButton(onPressed: () {}, child: const Text("Instagram")),
          // ],
            children: [
              buildStyledButton(
                context,
                "Facebook",
                () => _handleSocialClick(context, "https://www.facebook.com/yourPage", "Facebook"),
              ),
              buildStyledButton(
                context,
                "Twitter",
                () => _handleSocialClick(context, "https://twitter.com/yourProfile", "Twitter"),
              ),
              buildStyledButton(
                context,
                "Instagram",
                () => _handleSocialClick(context, "https://www.instagram.com/yourProfile", "Instagram"),
              ),
              // buildStyledButton(
              //   context,
              //   "Check Mental Health Status (Display)",
              //   () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => const DisplayStatusScreen(stressLevel: 65.0),
              //     ),
              //   ),
              // ),
              buildStyledButton(
                context,
                "Check Mental Health Status (Time Slot)",
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TimeSlotMentalStatusScreen(),
                  ),
                ),
              ),
              // ElevatedButton(
          //   onPressed: () => _openInAppBrowser("https://www.facebook.com", "Facebook"),
          //   child: const Text("Facebook"),
          // ),
          // ElevatedButton(
          //   onPressed: () => _openInAppBrowser("https://www.instagram.com", "Instagram"),
          //   child: const Text("Instagram"),
          // ),
            ],
          ),
        ),
      ),
    );
  }
}

