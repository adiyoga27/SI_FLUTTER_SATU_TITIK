import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/splashscreen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  checkAndRequestCameraPermission().then((bool hasPermission) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Satu Titik',
      home: SplashscreenPage(),
    );
  }
}

Future<bool> checkAndRequestCameraPermission() async {
  PermissionStatus status = await Permission.camera.status;

  if (!status.isGranted) {
    PermissionStatus permissionStatus = await Permission.camera.request();
    return permissionStatus.isGranted;
  }

  return status.isGranted;
}
