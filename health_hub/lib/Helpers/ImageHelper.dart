import 'dart:io';
import 'dart:typed_data'; // Make sure this is added
import 'package:path_provider/path_provider.dart';

Future<String> saveFaceImage(Uint8List imageBytes) async {
  final dir = await getApplicationDocumentsDirectory();
  final imagePath = '${dir.path}/face_${DateTime.now().millisecondsSinceEpoch}.jpg';
  final file = File(imagePath);
  await file.writeAsBytes(imageBytes);
  return imagePath;
}
