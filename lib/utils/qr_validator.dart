class QrValidator {
  static bool isValid(String qrData) {
    if (qrData.isEmpty) return false;
    return qrData.startsWith('ABSEN_');
  }
}
