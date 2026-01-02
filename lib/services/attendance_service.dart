import 'package:http/http.dart' as http;
import 'dart:convert';

class AttendanceService {
  static Future<String> sendQR(String qr) async {
    final url = Uri.parse(
      "https://script.google.com/macros/s/AKfycbyeOPtQPlDZva2lyn_vmO9aiDsG2RUqHEt9ehDrZM-e6w-TwBH6gm3RhA-J_k4apo2lLQ/exec",
    );

    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "waktu": DateTime.now().toIso8601String(),
        "qr_code": qr,
      }),
    );

    if (res.body.contains("duplicate")) return "⚠️ Siswa sudah absen";
    if (res.body.contains("success")) return "✅ Absensi berhasil";
    return "✅ Data terkirim";
  }
}
