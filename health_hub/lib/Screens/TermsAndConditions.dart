import 'package:flutter/material.dart';
import 'package:health_hub/Screens/MainDashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'dashboard.dart';

// class TermsAndConditions extends StatelessWidget {
//   const TermsAndConditions({super.key});

//   Future<void> acceptTerms(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', true);

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const Maindashboard()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Terms and Conditions")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const Expanded(
//               child: SingleChildScrollView(
//                 child: Text(
//                   "These are your terms and conditions. Please read them carefully...",
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => acceptTerms(context),
//               child: const Text("Accept and Continue"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// +++++++++++++++++++++++++++++++++++ full terms and conditions

// class TermsAndConditions extends StatelessWidget {
//   const TermsAndConditions({super.key});

//   Future<void> acceptTerms(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', true);

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const Maindashboard()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Terms and Conditions")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const Expanded(
//               child: SingleChildScrollView(
//                 child: Text(
//                   '''
// Note on Ethics & Permissions – Terms and Conditions

// 1. Introduction
// This application is part of a research project aimed at analyzing human expressions and mental health patterns from social media interactions. The app collects specific types of data (e.g., facial expressions and user activity) solely for academic research and non-commercial purposes. By using this app, you acknowledge and agree to the following terms.

// 2. Required Permissions
// To operate as intended, this app requests access to:

// • Camera Access:
//   - Used to capture facial expressions while interacting with content.
//   - Data is processed securely.
//   - No images or video are shared with third parties.

// • Activity Tracking:
//   - Used to monitor scrolling behavior, interaction time, and screen freeze patterns for behavioral analysis.

// • Internet Access:
//   - Required for connecting with APIs (e.g., Twitter) and uploading anonymized data for research analysis.

// 3. Purpose of Data Collection
// The data collected is used to:
// • Analyze facial expressions in response to different types of content.
// • Understand user engagement behaviors (scroll speed, pause time).
// • Generate insights into mental well-being and emotional trends.
// • Support academic research publications, without identifying individual users.

// 4. Data Privacy and Security
// • No Commercial Use:
//   - Your data is never used for advertising or sold to third parties.

// • Anonymity:
//   - All data is anonymized and stored securely. Personally identifiable information (PII) is not linked to any analysis.

// • Data Storage:
//   - Data is stored in encrypted databases, accessible only to the authorized research team.

// • No Facial Recognition:
//   - The app detects and classifies emotions, but does not identify users or store identifiable facial data.

// 5. Your Consent
// By using this app:
// • You voluntarily consent to the collection and analysis of your facial expressions and in-app behaviors.
// • You may withdraw your participation at any time by uninstalling the app or contacting the research team.

// 6. Privacy Policy
// Please review our [Privacy Policy] for complete information on:
// • How data is collected
// • How it is used and protected
// • Your rights as a user
// • Contact information for inquiries or data removal

// 7. Contact & Ethics Approval
// This research has been reviewed and approved by [Your University/Institution's Ethics Review Board].
// For questions or concerns, contact:
// 📧 research-support@yourdomain.com
// 📞 +123-456-7890

// 8. Final Acknowledgment
// By tapping "I Agree", you confirm that:
// • You are at least 18 years old.
// • You understand the purpose and scope of the app.
// • You agree to the ethical use of your data for research purposes.
//                   ''',
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => acceptTerms(context),
//               child: const Text("I Agree"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// +++++++++++++++++++++++++++++++++++++++++styles added

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  Future<void> acceptTerms(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Maindashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Light blue background
      appBar: AppBar(
        title: const Text("Terms and Conditions"),
        backgroundColor: Colors.lightBlue, // AppBar color
        foregroundColor: Colors.white, // AppBar text color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''
Note on Ethics & Permissions – Terms and Conditions

1. Introduction
This application is part of a research project aimed at analyzing human expressions and mental health patterns from social media interactions. The app collects specific types of data (e.g., facial expressions and user activity) solely for academic research and non-commercial purposes. By using this app, you acknowledge and agree to the following terms.

2. Required Permissions
To operate as intended, this app requests access to:

• Camera Access:
  - Used to capture facial expressions while interacting with content.
  - Data is processed securely.
  - No images or video are shared with third parties.

• Activity Tracking:
  - Used to monitor scrolling behavior, interaction time, and screen freeze patterns for behavioral analysis.

• Internet Access:
  - Required for connecting with APIs (e.g., Twitter) and uploading anonymized data for research analysis.

3. Purpose of Data Collection
The data collected is used to:
• Analyze facial expressions in response to different types of content.
• Understand user engagement behaviors (scroll speed, pause time).
• Generate insights into mental well-being and emotional trends.
• Support academic research publications, without identifying individual users.

4. Data Privacy and Security
• No Commercial Use:
  - Your data is never used for advertising or sold to third parties.

• Anonymity:
  - All data is anonymized and stored securely. Personally identifiable information (PII) is not linked to any analysis.

• Data Storage:
  - Data is stored in encrypted databases, accessible only to the authorized research team.

• No Facial Recognition:
  - The app detects and classifies emotions, but does not identify users or store identifiable facial data.

5. Your Consent
By using this app:
• You voluntarily consent to the collection and analysis of your facial expressions and in-app behaviors.
• You may withdraw your participation at any time by uninstalling the app or contacting the research team.

6. Privacy Policy
Please review our [Privacy Policy] for complete information on:
• How data is collected
• How it is used and protected
• Your rights as a user
• Contact information for inquiries or data removal

7. Contact & Ethics Approval
This research has been reviewed and approved by [Your University/Institution's Ethics Review Board].
For questions or concerns, contact:
📧 research-support@yourdomain.com
📞 +123-456-7890

8. Final Acknowledgment
By tapping "I Agree", you confirm that:
• You are at least 18 years old.
• You understand the purpose and scope of the app.
• You agree to the ethical use of your data for research purposes.
                  ''',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => acceptTerms(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "I Agree",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


