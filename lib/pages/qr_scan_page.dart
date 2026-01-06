import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/attendance_service.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final controller = MobileScannerController();
  String? message;
  bool scanning = true;

  Future<void> onScan(String code) async {
    setState(() => scanning = false);
    await controller.stop();
    message = await AttendanceService.sendQR(code);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Siswa")),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                MobileScanner(
                  controller: controller,
                  onDetect: (capture) {
                    if (!scanning) return;
                    final code = capture.barcodes.first.rawValue;
                    if (code != null) onScan(code);
                  },
                ),
                Container(color: Colors.black.withValues(alpha: 0.4)),
                Center(
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.greenAccent, width: 3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                if (message != null)
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Icon(
                            message!.contains("berhasil")
                                ? Icons.check_circle
                                : Icons.warning,
                            size: 60,
                            color:
                                message!.contains("berhasil")
                                    ? Colors.green
                                    : Colors.orange,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            message!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      message = null;
                      scanning = true;
                    });
                    await controller.start();
                  },
                  child: const Text("Scan Lagi"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
