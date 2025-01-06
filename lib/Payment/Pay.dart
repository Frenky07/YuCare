import 'package:flutter/material.dart';

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pembayaran'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.payment, size: 100, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              'Silahkan lakukan pembayaran untuk layanan konseling.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol bayar ditekan
                // Misalnya navigasi ke halaman sukses atau konfirmasi
              },
              child: Text('Bayar Sekarang'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
