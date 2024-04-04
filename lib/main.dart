import 'package:flutter/material.dart';
import 'package:qr_code_usauma/qr_code/qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr-Code Generator',
      home: QrCode(),
    );
  }
}
