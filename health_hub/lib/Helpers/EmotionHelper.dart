import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// Future<String?> predictEmotionFromImage(File imageFile) async {
//   final uri = Uri.parse("https://healthhubbackend-production.up.railway.app/predict"); // Replace with actual URL

//   final request = http.MultipartRequest('POST', uri)
//     ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

//     request.files.add(
//   await http.MultipartFile.fromPath(
//     'image', // 🔑 MUST match `request.files['image']`
//     imageFile.path,
//   ),
// );

//   try {
//     final streamedResponse = await request.send();
//     final response = await http.Response.fromStream(streamedResponse);

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       print('Predicted Emotion: ${jsonData['emotion']}');
//       return jsonData['emotion'] as String?;
//     } else {
//       print("Error: ${response.statusCode} - ${response.body}");
//       // return null;
//       return response.body;
//     }
//   } catch (e) {
//     print("Prediction error: $e");
//     return null;
//     // return response.body;
//   }
// }


// ++++++++++++++++++++++++++++++++++++++++++ updated

// ----------------------Image analyze emotion--------------------

Future<String?> predictEmotionFromImage(File imageFile) async {
  final uri = Uri.parse("https://healthhubbackend-production.up.railway.app/predict"); // Replace with actual URL

  final request = http.MultipartRequest('POST', uri);

  // Add the image file only once
  request.files.add(
    await http.MultipartFile.fromPath(
      'image', // 🔑 Must match `request.files['image']` in Flask
      imageFile.path,
    ),
  );

  try {
    final streamedResponse = await request.send();
    // final response = await http.Response.fromStream(streamedResponse);

    final response = await streamedResponse.stream.bytesToString();

    if (streamedResponse.statusCode == 200) {
      final jsonData = jsonDecode(response);
      print('Predicted Emotion: ${jsonData['emotion']}');
      return jsonData['emotion'] as String?;
    } else {
      print("Error: ${streamedResponse.statusCode} - ${response}");
      return null;
    }
  } catch (e) {
    print("Prediction error: $e");
    return null;
  }
}

// --------------------text analyze emotion---------------

Future<String?> predictEmotionFromText(String text) async {
  final uri = Uri.parse("https://healthhubbackend-production.up.railway.app/textmotion"); // Update to match your Flask NLP endpoint

  try {
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text}), // Sending text as JSON
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print('Predicted Emotion: ${jsonData['emotion']}');
      return jsonData['emotion'] as String?;
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return null;
    }
  } catch (e) {
    print("Prediction error: $e");
    return null;
  }
}


