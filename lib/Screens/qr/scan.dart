import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:satutitik/Screens/home/home.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:satutitik/Screens/reservasi/diningtable.dart';
import 'package:satutitik/controllers/CartController.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Permission? _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(height: Get.height, child: _buildQrView(context)),
          Positioned(
              top: 550.0,
              right: 10.0,
              left: 10.0,
              child: Text(
                'Please Scan Your Meja !!',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
          // Positioned(bottom: 10.0, left: 10.0, child: Text('adasdsad')),
          // Expanded(
          //   flex: 1,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         if (result != null)
          //           Text(
          //               'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //         else
          //           const Text('Scan a code'),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.toggleFlash();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getFlashStatus(),
          //                     builder: (context, snapshot) {
          //                       return Text('Flash: ${snapshot.data}');
          //                     },
          //                   )),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.flipCamera();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getCameraInfo(),
          //                     builder: (context, snapshot) {
          //                       if (snapshot.data != null) {
          //                         return Text(
          //                             'Camera facing ${describeEnum(snapshot.data!)}');
          //                       } else {
          //                         return const Text('loading');
          //                       }
          //                     },
          //                   )),
          //             )
          //           ],
          //         ),

          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  void _listenForPermissionStatus() async {
    Timer(Duration(seconds: 3), () async {
      final status = await _permission!.status;
      setState(() => _permissionStatus = status);
    });
    
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
  final cartCtrl = Get.put(CartController());
    
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
        // cartCtrl.reservasi(scanData.code.toString());
      Get.to(DinningTablePage());

      // setState(() {
      //   result = scanData;
      // });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
