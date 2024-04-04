import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_usauma/qr_code/qr_code_create.dart';
import 'package:qr_code_usauma/qr_code/scan_barcode.dart';

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0F2A20),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> QrCodeCreate()));
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFF00C8AA),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      child: Lottie.asset('assets/json/qr_create.json'),
                      width: 200,
                      height: 200,
                    ),
                    Text("QR COde Yaratish"),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ScanBarCode()));
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFF00C8AA),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      child: Lottie.asset('assets/json/qr_scan.json'),
                      width: 200,
                      height: 100,
                    ),
                    Text("Qr Codeni Skanerlash"),
                  ],
                ),

              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
