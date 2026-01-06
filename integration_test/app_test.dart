import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:absensi_qr/pages/home_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Flow HomePage ke QR Scan Page', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    await tester.pumpAndSettle();

    // Cek tombol ada
    expect(find.text('Mulai Scan QR'), findsOneWidget);

    // Tap tombol
    await tester.tap(find.text('Mulai Scan QR'));
    await tester.pumpAndSettle();

    // Pastikan halaman scan muncul
    expect(find.text('Scan QR Siswa'), findsOneWidget);
  });
}
