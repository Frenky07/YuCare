// // // import 'package:flutter/material.dart';
// // // import 'package:uts/Home.dart';
// // // import 'package:uts/LoginPage/Register.dart';

// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({super.key});

// // //   @override
// // //   LoginPageState createState() => LoginPageState();
// // // }

// // // class LoginPageState extends State<LoginPage> {
// // //   final TextEditingController _usernameController = TextEditingController();
// // //   final TextEditingController _passwordController = TextEditingController();

// // //   void _login() {
// // //     final username = _usernameController.text;
// // //     final password = _passwordController.text;

// // //     // Add your login logic here
// // //     if (username == 'admin' && password == 'admin') {
// // //       // Successful login
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(builder: (context) => Home()),
// // //       );
// // //     } else {
// // //       // Failed login
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text('Invalid username or password')),
// // //       );
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       resizeToAvoidBottomInset: true, // This will prevent the overflow error
// // //       appBar: AppBar(
// // //         title: const Text('Login Page'),
// // //         centerTitle: true,
// // //         automaticallyImplyLeading: false, // Menghilangkan ikon back
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: <Widget>[
// // //               // Space for the picture
// // //               Container(
// // //                 height: 150,
// // //                 width: 150,
// // //                 decoration: BoxDecoration(
// // //                   image: DecorationImage(
// // //                     image: AssetImage('assets/YuCare.jpg'), // Replace with your image path
// // //                     fit: BoxFit.cover,
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 20),
// // //               TextField(
// // //                 controller: _usernameController,
// // //                 decoration: const InputDecoration(labelText: 'Username'),
// // //               ),
// // //               TextField(
// // //                 controller: _passwordController,
// // //                 decoration: const InputDecoration(labelText: 'Password'),
// // //                 obscureText: true,
// // //               ),
// // //               const SizedBox(height: 20),
// // //               ElevatedButton(
// // //                 onPressed: _login,
// // //                 child: const Text('Login'),
// // //               ),
// // //               SizedBox(height: 10),
// // //                 ElevatedButton(
// // //                   onPressed: () {
// // //                     Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(builder: (context) => const RegisterPage()),
// // //                     );
// // //                   },
// // //                   child: const Text('Register'),
// // //                 ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:uts/Home.dart';
// import 'package:flutter/foundation.dart';
// import 'dart:io';
// import 'package:uts/LoginPage/Register.dart';
// import 'package:http/http.dart' as http;

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   Future<void> _login() async {
//   String url;

//   if (kIsWeb) {
//     url = 'http://localhost/flutter/api/login.php';
//   } else if (Platform.isAndroid) {
//     url = 'http://192.168.1.12/flutter/api/login.php';
//   } else {
//     url = 'http://localhost/flutter/api/login.php';
//   }

//   final email = _emailController.text;
//   final password = _passwordController.text;

//   final response = await http.post(
//     Uri.parse(url),
//     headers: {"Content-Type": "application/json"},
//     body: json.encode({
//       'email': email,
//       'password': password,
//     }),
//   );

//   final responseData = json.decode(response.body);

//   if (response.statusCode == 200) {
//     if (responseData['message'] == 'Login successful') {
//       // Navigate to Home with email
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Home()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(responseData['message'])),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Error: Unable to connect to server')),
//     );
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // Menghindari elemen tertutupi oleh keyboard
//       appBar: AppBar(
//         title: Text('Login Page'),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // Gambar atau logo aplikasi
//               Container(
//                 height: 150,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/YuCare.jpg'), // Ganti dengan path gambar Anda
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//               ),
//               TextField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const RegisterPage()),
//                   );
//                 },
//                 child: const Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uts/Home.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:uts/LoginPage/Register.dart';
import 'package:uts/PSikolog/RegisterPsychologist.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String url;

    if (kIsWeb) {
      url = 'http://localhost/flutter/api/login.php';
    } else if (Platform.isAndroid) {
      url = 'http://192.168.1.12/flutter/api/login.php';
    } else {
      url = 'http://localhost/flutter/api/login.php';
    }

    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      if (responseData['message'] == 'Login successful') {
        // Navigate to Home with email
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Unable to connect to server')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Menghindari elemen tertutupi oleh keyboard
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.purple.shade300, // Warna ungu yang tidak mencolok
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo atau Gambar Aplikasi
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/YuCare.jpg'), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Input Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.purple.shade400),
                  filled: true,
                  fillColor: Colors.purple.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Input Password
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.purple.shade400),
                  filled: true,
                  fillColor: Colors.purple.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // Tombol Login
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 211, 128, 226), // Warna ungu lembut
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),

              // Tombol Register
              TextButton(
                onPressed: () {
                  // Menampilkan modal untuk memilih tipe pengguna
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Pilih tipe akun Anda',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Menutup modal
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterPage(isPsychologist: false)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 226, 139, 241),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Sebagai User',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Menutup modal
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterPsychologistPage()),
                              );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 123, 223, 213),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Sebagai Psikolog',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Belum punya akun? Daftar di sini',
                  style: TextStyle(color: Colors.purple.shade400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
