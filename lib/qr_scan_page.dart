import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String _result = '';

  Future<void> _scanQRCode() async {
    String? qrCode = await scanner.scan();

    if (qrCode != null) {
      setState(() {
        _result = qrCode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scanned QR Code:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scanQRCode,
        icon: Icon(Icons.qr_code_scanner),
        label: Text('Scan QR Code'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
