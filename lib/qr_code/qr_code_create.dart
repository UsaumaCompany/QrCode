import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeCreate extends StatefulWidget {
  const QrCodeCreate({Key? key}) : super(key: key);

  @override
  State<QrCodeCreate> createState() => _QrCodeCreateState();
}

class _QrCodeCreateState extends State<QrCodeCreate> {
  String data = "";
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late TextEditingController create_qr;

  @override
  void initState() {
    create_qr=TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF0F2A20),
        elevation: 0,
      ),
      backgroundColor: Color(0XFF0F2A20),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              const Text(
                'Qr Code Yaratish',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
              ),
              const SizedBox(height: 50),
              Center(
                child: Container(
                    height: 300,
                    width: 300,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: data.isNotEmpty
                        ? QrImageView(
                        data: data, version: QrVersions.auto, size: 300)
                        : Image.asset(
                      'assets/images/other/me.jpg',
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: TextField(
                  controller: create_qr,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      data = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "kerakli textni kiriting ... !",
                    suffixIcon: GestureDetector(
                      onTap: create_qr.text!=''
                          ? () async {
                        await FlutterClipboard.copy(create_qr.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('✔️ Copied to Clipboard')),
                        );
                      }
                      : null,
                      child: SvgPicture.asset("assets/icon/copy.svg",),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70.0),
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.amber,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 36.0,
                  vertical: 16.0,
                ),
                child: Text(
                  data.isEmpty ? "Generate QR Code" : "Qr Codeni saqlash&",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
