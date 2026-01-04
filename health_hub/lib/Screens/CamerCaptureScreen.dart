import 'package:flutter/material.dart';

class CameraCaptureScreen extends StatelessWidget {
  const CameraCaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // In real usage, integrate camera package to show preview and capture
    return Scaffold(
      appBar: AppBar(title: const Text("Capture Face")),
      body: const Center(child: Text("Camera screen placeholder")),
    );
  }
}
