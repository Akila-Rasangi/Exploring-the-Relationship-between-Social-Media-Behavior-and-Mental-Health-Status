import 'package:flutter/material.dart';
import 'package:health_hub/Helpers/DataStoreHelper.dart';
import 'package:health_hub/Screens/CamerCaptureScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dart:ui' as ui;
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';
// import '../helpers/data_storage_helper.dart'; // <-- Your helper method

// class WebViewScreen extends StatefulWidget {
//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..addJavaScriptChannel(
//         'ScrollLogger',
//         onMessageReceived: (JavaScriptMessage message) {
//           final msg = message.message;
//           if (msg.startsWith("scroll_stopped_at_")) {
//             final timestamp = msg.replaceFirst("scroll_stopped_at_", "");
//             print("🛑 Scroll stopped at $timestamp");
//             // TODO: Trigger face capture or emotion analysis here
//           } else if (msg == "scrolling") {
//             print("📜 Scrolling...");
//           }
//         },
//       )
//       ..loadRequest(Uri.parse('https://twitter.com'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Social Feed Tracker"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/');
//             },
//           ),
//         ],
//       ),
//       body: WebViewWidget(controller: _controller),
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     // Inject scroll tracking JavaScript once the page finishes loading
//     _controller.setNavigationDelegate(
//       NavigationDelegate(
//         onPageFinished: (url) {
//           _controller.runJavaScript('''
//             let scrollTimeout;
//             window.addEventListener('scroll', function() {
//               ScrollLogger.postMessage("scrolling");
//               clearTimeout(scrollTimeout);
//               scrollTimeout = setTimeout(() => {
//                 ScrollLogger.postMessage("scroll_stopped_at_" + new Date().toISOString());
//               }, 600);
//             });
//           ''');
//         },
//       ),
//     );
//   }
// }


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// class WebViewScreen extends StatelessWidget {
//   final String url;
//   final String platform;

//   const WebViewScreen({super.key, required this.url, required this.platform});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(platform)),
//       body: WebViewWidget(
//         controller: WebViewController()
//           ..setJavaScriptMode(JavaScriptMode.unrestricted)
//           ..loadRequest(Uri.parse(url)),
//       ),
//     );
//   }
// }

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


// class WebViewScreen extends StatefulWidget {
//   final String url;
//   final String platform;

//   const WebViewScreen({super.key, required this.url, required this.platform});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.platform)),
//       body: WebViewWidget(controller: _controller),
//     );
//   }
// }

// ++++++++++++++++++++++++++++++++++++++++++++++

// class WebViewScreen extends StatefulWidget {
//   final String url;
//   final String platform;

//   const WebViewScreen({super.key, required this.url, required this.platform});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late final WebViewController _controller;
//   late DateTime _loginTime;

//   @override
//   void initState() {
//     super.initState();

//     // Record login time when the web view opens
//     _loginTime = DateTime.now();
//     print("User opened ${widget.platform} at: $_loginTime");

//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   void _handleLogoutAndNavigate() {
//     final DateTime logoutTime = DateTime.now();
//     print("User left ${widget.platform} at: $logoutTime");

//     // You can optionally save session duration or send to backend
//     final duration = logoutTime.difference(_loginTime);
//     print("Session Duration on ${widget.platform}: ${duration.inSeconds} seconds");

//     Navigator.pop(context); // Navigate back to main dashboard
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.platform)),
//       body: WebViewWidget(controller: _controller),

//       // Floating button to exit and track session
//       floatingActionButton: FloatingActionButton(
//         onPressed: _handleLogoutAndNavigate,
//         child: const Icon(Icons.exit_to_app),
//         tooltip: "Exit and log session",
//       ),
//     );
//   }
// }

// +++++++++++++++++++++++++++++++++++++++++++with camera but navigate to camera page

// class WebViewScreen extends StatefulWidget {
//   final String url;
//   final String platform;

//   const WebViewScreen({super.key, required this.url, required this.platform});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late final WebViewController _controller;
//   late DateTime _loginTime;
//   Timer? _scrollStopTimer;

//   @override
//   void initState() {
//     super.initState();

//     // Record login time when the WebView opens
//     _loginTime = DateTime.now();
//     print("User opened ${widget.platform} at: $_loginTime");

//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..addJavaScriptChannel(
//         'ScrollDetector',
//         onMessageReceived: (message) {
//           _onScrollDetected();
//         },
//       )
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (url) => _injectScrollListener(),
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   void _injectScrollListener() {
//     _controller.runJavaScript('''
//       let lastScrollTime = Date.now();
//       window.addEventListener('scroll', function() {
//         if (Date.now() - lastScrollTime > 300) {
//           ScrollDetector.postMessage("scrolling");
//           lastScrollTime = Date.now();
//         }
//       });
//     ''');
//   }

//   void _onScrollDetected() {
//     _scrollStopTimer?.cancel();
//     _scrollStopTimer = Timer(const Duration(seconds: 3), () {
//       print("User stopped scrolling for 3 seconds on ${widget.platform}");
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => const CameraCaptureScreen()),
//       );
//     });
//   }

//   void _handleLogoutAndNavigate() {
//     final DateTime logoutTime = DateTime.now();
//     print("User left ${widget.platform} at: $logoutTime");

//     // You can optionally save session duration or send to backend
//     final duration = logoutTime.difference(_loginTime);
//     print("Session Duration on ${widget.platform}: ${duration.inSeconds} seconds");

//     Navigator.pop(context); // Navigate back to main dashboard
//   }

//   @override
//   void dispose() {
//     _scrollStopTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.platform)),
//       body: WebViewWidget(controller: _controller),

//       floatingActionButton: FloatingActionButton(
//         onPressed: _handleLogoutAndNavigate,
//         child: const Icon(Icons.exit_to_app),
//         tooltip: "Exit and log session",
//       ),
//     );
//   }
// }


// ++++++++++++++++++++++++++++++++++++++++++++++++++++ With camera not naviagte to another camera page

// class WebViewScreen extends StatefulWidget {
//   final String url;
//   final String platform;

//   const WebViewScreen({super.key, required this.url, required this.platform});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late final WebViewController _controller;
//   late DateTime _loginTime;
//   Timer? _scrollStopTimer;

//   bool _showCamera = false;
//   CameraController? _cameraController;
//   List<CameraDescription>? _cameras;

//   @override
//   void initState() {
//     super.initState();

//     // Record login time when the WebView opens
//     _loginTime = DateTime.now();
//     print("User opened ${widget.platform} at: $_loginTime");

//     _initializeCamera();

//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..addJavaScriptChannel(
//         'ScrollDetector',
//         onMessageReceived: (message) {
//           _onScrollDetected();
//         },
//       )
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (url) => _injectScrollListener(),
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   Future<void> _initializeCamera() async {
//     try {
//       _cameras = await availableCameras();
//       final frontCamera = _cameras!.firstWhere(
//         (cam) => cam.lensDirection == CameraLensDirection.front,
//       );
//       _cameraController = CameraController(
//         frontCamera,
//         ResolutionPreset.low,
//         enableAudio: false,
//       );
//       await _cameraController!.initialize();
//       setState(() {}); // Refresh UI when camera is ready
//     } catch (e) {
//       print("Error initializing camera: $e");
//     }
//   }

//   void _injectScrollListener() {
//     _controller.runJavaScript('''
//       let lastScrollTime = Date.now();
//       window.addEventListener('scroll', function() {
//         if (Date.now() - lastScrollTime > 300) {
//           ScrollDetector.postMessage("scrolling");
//           lastScrollTime = Date.now();
//         }
//       });
//     ''');
//   }

//   // this is the function without content capture when the scroll stops
//   // void _onScrollDetected() {
//   //   _scrollStopTimer?.cancel();
//   //   _scrollStopTimer = Timer(const Duration(seconds: 3), () {
//   //     print("User stopped scrolling for 3 seconds on ${widget.platform}");
//   //     _captureFace();
//   //   });
//   // }

//   void _onScrollDetected() {
//   _scrollStopTimer?.cancel();
//   _scrollStopTimer = Timer(const Duration(seconds: 3), () async {
//     print("User stopped scrolling for 3 seconds on ${widget.platform}");

//     // 1. Capture face
//     await _captureFace();

//     // 2. Capture visible content
//     String jsExtractContent = '''
//       (function() {
//         let visibleText = '';
//         const elements = document.elementsFromPoint(window.innerWidth/2, window.innerHeight/2);
//         for (let el of elements) {
//           if (el.innerText && el.innerText.trim().length > 30) {
//             visibleText = el.innerText.trim();
//             break;
//           }
//         }
//         return visibleText;
//       })();
//     ''';

//     try {
//       final content = await _controller.runJavaScriptReturningResult(jsExtractContent);
//       print("Visible content: \$content");
//     } catch (e) {
//       print("Failed to get visible content: \$e");
//     }
//   });
// }


//   Future<void> _captureFace() async {
//     if (_cameraController == null || !_cameraController!.value.isInitialized) return;

//     setState(() {
//       _showCamera = true;
//     });

//     await Future.delayed(const Duration(milliseconds: 500)); // Let camera preview appear

//     try {
//       final XFile image = await _cameraController!.takePicture();

//       final Directory dir = await getApplicationDocumentsDirectory();
//       final String imagePath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
//       await image.saveTo(imagePath);

//       print("Face image saved at: $imagePath");
//     } catch (e) {
//       print("Error capturing face: $e");
//     }

//     await Future.delayed(const Duration(seconds: 2));

//     setState(() {
//       _showCamera = false;
//     });
//   }

//   void _handleLogoutAndNavigate() {
//     final DateTime logoutTime = DateTime.now();
//     print("User left ${widget.platform} at: $logoutTime");

//     // You can optionally save session duration or send to backend
//     final duration = logoutTime.difference(_loginTime);
//     print("Session Duration on ${widget.platform}: ${duration.inSeconds} seconds");

//     Navigator.pop(context); // Navigate back to main dashboard
//   }

//   @override
//   void dispose() {
//     _scrollStopTimer?.cancel();
//     _cameraController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.platform)),
//       body: Stack(
//         children: [
//           WebViewWidget(controller: _controller),
//           if (_showCamera &&
//               _cameraController != null &&
//               _cameraController!.value.isInitialized)
//             Positioned(
//               top: 80,
//               right: 16,
//               width: 120,
//               height: 160,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: CameraPreview(_cameraController!),
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _handleLogoutAndNavigate,
//         tooltip: "Exit and log session",
//         child: const Icon(Icons.exit_to_app),
//       ),
//     );
//   }
// }

// ++++++++++++++++++++++++++++++++++++++ with storing images and screenshots and timestamps



class WebViewScreen extends StatefulWidget {
  final String url;
  final String platform;

  const WebViewScreen({super.key, required this.url, required this.platform});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  late DateTime _loginTime;
  Timer? _scrollStopTimer;

  bool _showCamera = false;
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  Uint8List? _capturedFaceBytes;
  String _capturedContent = "";

  @override
  void initState() {
    super.initState();

    _loginTime = DateTime.now();
    print("User opened ${widget.platform} at: $_loginTime");

    _initializeCamera();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'ScrollDetector',
        onMessageReceived: (message) => _onScrollDetected(),
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) => _injectScrollListener(),
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      final frontCamera = _cameras!.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.front,
      );
      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await _cameraController!.initialize();
      setState(() {});
    } catch (e) {
      print("Camera error: $e");
    }
  }

  void _injectScrollListener() {
    _controller.runJavaScript('''
      let lastScrollTime = Date.now();
      window.addEventListener('scroll', function() {
        if (Date.now() - lastScrollTime > 300) {
          ScrollDetector.postMessage("scrolling");
          lastScrollTime = Date.now();
        }
      });
    ''');
  }

  void _onScrollDetected() {
    _scrollStopTimer?.cancel();
    _scrollStopTimer = Timer(const Duration(seconds: 3), () async {
      print("User stopped scrolling for 3 seconds on ${widget.platform}");

      // 1. Capture face
      await _captureFace();

      // 2. Extract visible screen content
      try {
        final js = '''
          (function() {
            let visibleText = '';
            const elements = document.elementsFromPoint(window.innerWidth/2, window.innerHeight/2);
            for (let el of elements) {
              if (el.innerText && el.innerText.trim().length > 30) {
                visibleText = el.innerText.trim();
                break;
              }
            }
            return visibleText;
          })();
        ''';

        final result = await _controller.runJavaScriptReturningResult(js);
        _capturedContent = result.toString().replaceAll('"', '').trim();
        print("Captured content: $_capturedContent");

        // 3. Store face + content + login/logout
        final logoutTime = DateTime.now();
        if (_capturedFaceBytes != null) {
          await storeCapturedData(
            faceBytes: _capturedFaceBytes!,
            content: _capturedContent,
            login: _loginTime,
            logout: logoutTime,
          );
        }
      } catch (e) {
        print("Content capture failed: $e");
      }
    });
  }

  Future<void> _captureFace() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;

    setState(() => _showCamera = true);
    await Future.delayed(const Duration(milliseconds: 500)); // let preview show

    try {
      final XFile image = await _cameraController!.takePicture();
      final Uint8List bytes = await image.readAsBytes();
      _capturedFaceBytes = bytes;

      print("Face image captured");
    } catch (e) {
      print("Face capture failed: $e");
    }

    await Future.delayed(const Duration(seconds: 2));
    setState(() => _showCamera = false);
  }

  void _handleLogoutAndNavigate() {
    final logoutTime = DateTime.now();
    print("User left ${widget.platform} at: $logoutTime");

    // Optionally store session
    final duration = logoutTime.difference(_loginTime);
    print("Session Duration: ${duration.inSeconds} seconds");

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _scrollStopTimer?.cancel();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.platform)),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_showCamera &&
              _cameraController != null &&
              _cameraController!.value.isInitialized)
            Positioned(
              top: 80,
              right: 16,
              width: 120,
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CameraPreview(_cameraController!),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleLogoutAndNavigate,
        tooltip: "Exit and log session",
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}





