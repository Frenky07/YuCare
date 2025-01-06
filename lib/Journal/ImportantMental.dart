import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MentalHealthScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            backgroundColor: Colors.blue,
          ),
          child: Text(
            'Lihat Artikel',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MentalHealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900, // Warna background utama
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white, // Warna background kotak
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Mengapa Kesehatan Mental Itu Penting?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Kesehatan mental merupakan sektor penting dalam mewujudkan kesehatan secara menyeluruh. Terdapat sekitar 450 juta orang menderita gangguan mental dan perilaku di seluruh dunia, terbanyak di India (4,5%). Satu dari empat orang menderita satu atau lebih gangguan mental selama masa hidup mereka. Gangguan mental jika tidak ditangani dengan tepat, akan bertambah parah, dan akhirnya dapat membebani keluarga, masyarakat, serta pemerintah. Studi ini bertujuan mengetahui situasi kesehatan mental pada masyarakat Indonesia dan strategi penanggulangannya.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Metode: Tulisan ini menggunakan analisis deskriptif eksploratif, melalui tinjauan literatur dan kajian data sekunder. Unit analisis yaitu situasi kesehatan mental di Indonesia.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Hasil Penelitian: Berdasarkan kajian data Riskesdas 2013 diketahui prevalensi gangguan mental berat pada penduduk Indonesia 1,7%, terbanyak di Yogyakarta, Aceh, Sulawesi Selatan. Adapun gangguan mental emosional dengan gejala-gejala depresi dan kecemasan sekitar 6%. Hingga saat ini, masih terdapat stigma dan diskriminasi terhadap orang dengan gangguan mental di Indonesia, sehingga menghalangi penanganan serta perlakuan salah seperti penyangkalan. Oleh karena itu strategi yang optimal perlu dilakukan bagi setiap individu, keluarga dan masyarakat dengan pendekatan promotif, preventif, kuratif, dan rehabilitatif secara...',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya (HomePage)
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      backgroundColor: Colors.blue, // Warna tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Selesai',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
