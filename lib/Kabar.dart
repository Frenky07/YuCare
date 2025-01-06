import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Feel {
  final int id;
  final String nama;

  Feel({required this.id, required this.nama});

  /**
   * RUN PHP DI TERMINAl
   */

  factory Feel.fromJson(Map<String, dynamic> json) {
    return Feel(
      id: json['id'],
      nama: json['nama'],
    );
  }
}

Future<List<Feel>> fetchFeel() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1:10000/feel.php'));

  if (response.statusCode == 200) {
    // Parse JSON jika request sukses
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((data) => Feel.fromJson(data)).toList();
  } else {
    // Throw error jika request gagal
    throw Exception('Failed to load feeling');
  }
}

class Situation extends StatefulWidget {
  late final String feeling;
  // const Situation({super.key, required this.feeling});

  @override
  _SituationState createState() => _SituationState();
}

class _SituationState extends State<Situation> {
  late Future<List<Feel>> futureDosen;

  @override
  void initState() {
    super.initState();
    futureDosen = fetchFeel(); // Fetch data dosen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apakah Sudah Tidur?'),
        backgroundColor: Colors.purple[100],
      ),
      body: Center(
          
          child: Column(
            children: [
              // Widget untuk menampilkan gambar
              Image.network(
                'http://127.0.0.1:10000/ado.php', // URL gambar
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Failed to load image');
                },
              ),
              const SizedBox(height: 20), // Jarak antara gambar dan daftar
              // Widget untuk fetch dan menampilkan daftar dosen
              Expanded(
                child: FutureBuilder<List<Feel>>(
                  future: futureDosen,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final dosen = snapshot.data![index];
                          return ListTile(
                            title: Text(dosen.nama),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    // Indikator loading
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),



      //   child: ConstrainedBox(
      //     constraints: BoxConstraints.expand(
      //       height: 400,
      //       width: 400,
      //     ),
      //     child: Container(
      //       color: Colors.grey[350],
      //       child: Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: ListView.builder(
      //           itemCount:
      //               Feelings.length, // Menggunakan Feelings dari Cerita.dart
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 8.0),
      //               child: Container(
      //                 padding: const EdgeInsets.all(16.0),
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(16.0),
      //                   boxShadow: const [
      //                     BoxShadow(
      //                       color: Colors.black26,
      //                       blurRadius: 6.0,
      //                       offset: Offset(0, 3),
      //                     ),
      //                   ],
      //                 ),
      //                 child: Text(
      //                   Feelings[
      //                       index], // Mengambil elemen Feelings berdasarkan index
      //                   style: const TextStyle(
      //                     fontSize: 16,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.black,
      //                   ),
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
