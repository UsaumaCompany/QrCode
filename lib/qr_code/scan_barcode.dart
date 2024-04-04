import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanBarCode extends StatefulWidget {
  const ScanBarCode({super.key});

  @override
  State<ScanBarCode> createState() => _ScanBarCodeState();
}

class _ScanBarCodeState extends State<ScanBarCode> {
  String _scanResult = "";


  ///create scan function
  Future<void> scanCode()async {
    String barcodeScanRes;
    try{
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode (
          "#ff6666", "Cancel", true, ScanMode.QR);
    } on PlatformException{
      barcodeScanRes = "Failed to scan";
    }

    setState(() {
      _scanResult = barcodeScanRes;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0F2A20),
      appBar: AppBar(
          backgroundColor: Color(0XFF0F2A20),
          elevation: 0,
          title: const Text( 'Scaner Qilish' )),
      body: Builder(builder: (BuildContext context){
        return Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: _scanResult!=''?MainAxisAlignment.start:MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    scanCode();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF00C8AA),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text( 'Skaner qilish uchun bosing'),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                _scanResult!=''
                    ? Column(
                  children: [
                    Container(
                      width: 250,
                      color: Color(0XFF35404D),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                        child: Text(_scanResult,style:
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () async {
                              await FlutterClipboard.copy(_scanResult);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('✔️ Copied to Clipboard')),
                              );
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset('assets/icon/copy_white.svg'),
                                Text("Copy",style:  TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  letterSpacing: -0.1,
                                ),),

                              ],
                            )),
                        GestureDetector(
                            onTap: () async {},
                            child: Column(
                              children: [
                                SvgPicture.asset('assets/icon/share.svg'),
                                Text("Share",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  letterSpacing: -0.1,
                                ),),
                              ],
                            )),
                      ],
                    ),
                  ],
                )
                    : SizedBox.shrink(),

              ],
            ),
          ),
        );
      }),
    );
  }
}
