import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';

import 'home_screen.dart';
import 'take_picture.dart';
import 'pick_image.dart';

late List<CameraDescription> _cameras;

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen(), routes: [
      GoRoute(
          path: 'take_picture',
          builder: (context, state) {
            // return TakePictureScreen(camera: _cameras.first);
            return MaterialApp(
              title: 'Image Picker Demo',
              home: MyHomePage(),
            );
          })
    ]),
  ],
);

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
