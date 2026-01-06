import 'package:flutter/material.dart';
import 'qr_scan_page.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Absensi QR Guru")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_2, size: 120, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              "Absensi Digital Guru",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Cepat • Aman • Paperless"),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CustomButton(
                text: "Mulai Scan QR",
                icon: Icons.qr_code_scanner,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QRScanPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
