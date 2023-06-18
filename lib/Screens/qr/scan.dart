import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/controllers/CartController.dart';
import 'package:satutitik/controllers/ReservasiController.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final cartReservasi = Get.put(ReservasiController());

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Permission? _permission;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void initState() {
    super.initState();

    // _listenForPermissionStatus();
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
          Positioned(
              top: 60.0,
              right: 20.0,
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BaseUrlPopup();
                      },
                    );
                  },
                  child: Container(
                      child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ))))
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
      await _permission!.status;
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

  void _onQRViewCreated(QRViewController ctrlQr) {
    setState(() {
      this.controller = controller;
    });
    ctrlQr.scannedDataStream.listen((scanData) {
      // Timer(Duration(seconds: 5), () {
      cartReservasi.reservasi(scanData.code.toString());
      print(scanData.code.toString());
      //     // cartCtrl.reservasi(scanData.code.toString());
      //   });
      //   // Get.to(Sca());

      //   // setState(() {
      //   //   result = scanData;
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

class BaseUrlPopup extends StatefulWidget {
  @override
  _BaseUrlPopupState createState() => _BaseUrlPopupState();
}

class _BaseUrlPopupState extends State<BaseUrlPopup> {
  TextEditingController _baseUrlController = TextEditingController();
  final cookies = GetStorage();
  @override
  void initState() {
    super.initState();
    _loadBaseUrl();
  }

  _loadBaseUrl() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String baseUrl = cookies.read('baseurl') ?? '';
    String baseUrl = AppConfig().baseUrl ?? '';
    setState(() {
      _baseUrlController.text = baseUrl;
    });
  }

  _saveBaseUrl(String baseUrl) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('base_url', baseUrl);
    cookies.write('baseurl', baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Base URL'),
      content: TextFormField(
        controller: _baseUrlController,
        decoration: InputDecoration(labelText: 'Enter Base URL'),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            String baseUrl = _baseUrlController.text;
            _saveBaseUrl(baseUrl);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
