import 'dart:typed_data';
import 'package:health_hub/Helpers/DatabaseHelper.dart';
import 'package:health_hub/Helpers/ImageHelper.dart';
import 'dart:io';
import 'package:health_hub/Helpers/EmotionHelper.dart';

// Future<void> storeCapturedData({
//   required Uint8List faceBytes,
//   required String content,
//   required DateTime login,
//   required DateTime logout,
// }) async {
//   final faceImagePath = await saveFaceImage(faceBytes);
//   await DatabaseHelper().insertRecord(
//     faceImagePath: faceImagePath,
//     content: content,
//     loginTime: login.toIso8601String(),
//     logoutTime: logout.toIso8601String(),
//   );
// }


// +++++++++++++++++++++++++++++++++++++++++++ update with face image upload and predict the prediction

Future<void> storeCapturedData({
  required Uint8List faceBytes,
  required String content,
  required DateTime login,
  required DateTime logout,
  // required String emotion,
  // String? emotion,
}) async {
  final faceImagePath = await saveFaceImage(faceBytes);
  final facialEmotion = await predictEmotionFromImage(File(faceImagePath));
  final textualEmotion = await predictEmotionFromImage(File(content));

  print("Predicted Emotion: $facialEmotion"); // ✅ You can show a snackbar or log it

  await DatabaseHelper().insertRecord(
    faceImagePath: faceImagePath,
    content: content,
    loginTime: login.toIso8601String(),
    logoutTime: logout.toIso8601String(),
    emotion: facialEmotion ?? 'unknown',
  );
}

