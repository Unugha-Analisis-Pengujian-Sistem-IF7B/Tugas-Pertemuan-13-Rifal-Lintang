import 'package:flutter_test/flutter_test.dart';
import 'package:absensi_qr/utils/qr_validator.dart';

void main() {
  test('QR valid jika diawali ABSEN_', () {
    final result = QrValidator.isValid('ABSEN_123');
    expect(result, true);
  });

  test('QR tidak valid jika kosong', () {
    final result = QrValidator.isValid('');
    expect(result, false);
  });
}
