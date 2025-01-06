// import 'package:flutter/material.dart';

// class Editbio extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: EditBio(),
//     );
//   }
// }

// class EditBio extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Akun Personal'),
//       ),
//       body: SingleChildScrollView( // Membungkus dengan SingleChildScrollView
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Nama Lengkap',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(hintText: 'Masukkan nama lengkap'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Alamat Email',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(hintText: 'Masukkan email'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Gender',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             DropdownButton<String>(
//               items: <String>['Laki-laki', 'Perempuan']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (_) {},
//               hint: Text('Pilih Gender'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Tanggal Lahir',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(hintText: 'Masukkan tanggal lahir'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Negara',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(hintText: 'Masukkan negara'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Kota / Kabupaten',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(hintText: 'Masukkan kota/kabupaten'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Nomor Ponsel (Opsional)',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(hintText: 'Masukkan nomor ponsel'),
//             ),
//             SizedBox(height: 24),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Simpan Perubahan
//                 },
//                 child: Text('Simpan Perubahan'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';

// class EditBio extends StatefulWidget {
//   final String email;

//   EditBio({required this.email}); // Constructor to accept email

//   @override
//   _EditBioState createState() => _EditBioState();
// }

// class _EditBioState extends State<EditBio> {
//   final _NamaLengkapController = TextEditingController();
//   final _EmailController = TextEditingController();
//   final _dateController = TextEditingController();
//   final _Domisili = TextEditingController();
//   final _phoneController = TextEditingController();

//   String? _selectedGender;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData(); // Call the method to fetch user data
//     print("Email: ${widget.email}");


//   }

//   Future<void> _fetchUserData() async {
//   String url;

//   if (kIsWeb) {
//     url = 'http://localhost/flutter/api/get_user_data.php';
//   } else if (Platform.isAndroid) {
//     url = 'http://192.168.1.12/flutter/api/get_user_data.php';  // Update with your local IP
//   } else {
//     url = 'http://localhost/flutter/api/get_user_data.php';
//   }

//     final response = await http.post(
//     Uri.parse(url),
//     headers: {"Content-Type": "application/x-www-form-urlencoded"},
//     body: {
//       'email': widget.email,  // Send the email as form data
//     },
//   );


//   if (response.statusCode == 200) {
//     print(response.body);  // Debugging the raw response
//     try {
//       final data = json.decode(response.body);  // Decode the JSON response
//       print(data);  // Check the structure of the response

//       if (data['status'] == 'success') {
//         setState(() {
//           _NamaLengkapController.text = data['user']['full_name'];
//           _EmailController.text = data['user']['email'];
//           _dateController.text = data['user']['date_of_birth'];
//           _Domisili.text = data['user']['domisili'] ?? '';  // Handle null 'domisili'
//           _phoneController.text = data['user']['phone_number'];
//           _selectedGender = data['user']['gender'];
//         });
//       } else {
//         // Handle the case where user is not found
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(data['message'] ?? 'User not found')),
//         );
//       }
//     } catch (e) {
//       print('Error decoding JSON: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error decoding data')),
//       );
//     }
//   } else {
//     print("Error: ${response.statusCode}");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error fetching user data')),
//     );
//   }
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Akun Personal'),
//       ),
//       body: SingleChildScrollView( 
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Nama Lengkap',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _NamaLengkapController,
//               decoration: InputDecoration(hintText: 'Masukkan nama lengkap'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Alamat Email',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _EmailController,
//               decoration: InputDecoration(hintText: 'Masukkan email'),
//               enabled: false,
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Gender',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             DropdownButton<String>(
//               value: _selectedGender,
//               items: <String>['Laki-laki', 'Perempuan']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedGender = value;
//                 });
//               },
//               hint: Text('Pilih Gender'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Tanggal Lahir',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(hintText: 'Masukkan tanggal lahir'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _Domisili,
//               decoration: InputDecoration(hintText: 'Masukkan Domisili'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Nomor Ponsel (Opsional)',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _phoneController,
//               decoration: InputDecoration(hintText: 'Masukkan nomor ponsel'),
//             ),
//             SizedBox(height: 24),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Simpan Perubahan
//                 },
//                 child: Text('Simpan Perubahan'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
// 
// 
// 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class EditBio extends StatefulWidget {
  final String email;

  EditBio({required this.email}); // Constructor to accept email

  @override
  _EditBioState createState() => _EditBioState();
}

class _EditBioState extends State<EditBio> {
  final _NamaLengkapController = TextEditingController();
  final _EmailController = TextEditingController();
  final _dateController = TextEditingController();
  final _Domisili = TextEditingController();
  final _phoneController = TextEditingController();

  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Call the method to fetch user data
    print("Email: ${widget.email}");
  }

  Future<void> _fetchUserData() async {
    String url;

    if (kIsWeb) {
      url = 'http://localhost/flutter/api/get_user_data.php';
    } else if (Platform.isAndroid) {
      url = 'http://192.168.1.12/flutter/api/get_user_data.php';  // Update with your local IP
    } else {
      url = 'http://localhost/flutter/api/get_user_data.php';
    }

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        'email': widget.email,  // Send the email as form data
      },
    );

    if (response.statusCode == 200) {
      print(response.body);  // Debugging the raw response
      try {
        final data = json.decode(response.body);  // Decode the JSON response
        print(data);  // Check the structure of the response

        if (data['status'] == 'success') {
          setState(() {
            _NamaLengkapController.text = data['user']['full_name'];
            _EmailController.text = data['user']['email'];
            _dateController.text = data['user']['date_of_birth'];
            _Domisili.text = data['user']['domisili'] ?? '';  // Handle null 'domisili'
            _phoneController.text = data['user']['phone_number'];
            _selectedGender = data['user']['gender'];
          });
        } else {
          // Handle the case where user is not found
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'User not found')),
          );
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error decoding data')),
        );
      }
    } else {
      print("Error: ${response.statusCode}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun Personal'),
        backgroundColor: Colors.deepPurple,  // Calming purple theme
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _NamaLengkapController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama lengkap',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Alamat Email',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _EmailController,
              decoration: InputDecoration(
                hintText: 'Masukkan email',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              enabled: false,
            ),
            SizedBox(height: 16),
            Text(
              'Gender',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              decoration: InputDecoration(
                hintText: 'Pilih Gender',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              items: <String>['Laki-laki', 'Perempuan']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal Lahir',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                hintText: 'Masukkan tanggal lahir',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _Domisili,
              decoration: InputDecoration(
                hintText: 'Masukkan Domisili',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nomor Ponsel (Opsional)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'Masukkan nomor ponsel',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Simpan Perubahan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Calming purple color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Simpan Perubahan',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
