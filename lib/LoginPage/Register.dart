// import 'package:flutter/material.dart';
// import 'package:uts/LoginPage/Login.dart';
// import 'package:http/http.dart' as http;

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _EmailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _NamaLengkapController = TextEditingController();
//   final _NoTeleponController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _dateController = TextEditingController();

//   String? _selectedGender; // Variabel untuk menyimpan nilai yang dipilih

//   void _register() {
//     final Email = _EmailController.text;
//     final password = _passwordController.text;
//     final NamaLengkap = _NamaLengkapController.text;
//     final NoTelepon = _NoTeleponController.text;
//     final confirmPassword = _confirmPasswordController.text;

//     if (password == confirmPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Registration Successful')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Passwords do not match')),
//       );
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime selectedDate = DateTime.now();
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );

//     if (pickedDate != null && pickedDate != selectedDate) {
//       setState(() {
//         _dateController.text =
//             '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register Page'),
//       ),
//       resizeToAvoidBottomInset: true, // Mencegah overflow saat keyboard muncul
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _NamaLengkapController,
//               decoration: const InputDecoration(labelText: 'Nama Lengkap'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _EmailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             const SizedBox(height: 16),
//             DropdownButton<String>(
//               value: _selectedGender, // Menampilkan nilai yang dipilih
//               items: <String>['Laki-laki', 'Perempuan']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedGender = newValue; // Menyimpan nilai yang dipilih
//                 });
//               },
//               hint: const Text('Pilih Gender'),
//             ),
//             const SizedBox(height: 16),
//             Text('Tanggal Lahir:', style: TextStyle(fontSize: 18)),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(
//                 hintText: 'Pilih Tanggal Lahir',
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.calendar_today),
//                   onPressed: () => _selectDate(context),
//                 ),
//               ),
//               readOnly: true,
//             ),
//             const SizedBox(
//                 height: 16), // Menambah jarak yang lebih besar di sini
//             TextField(
//               controller: _NoTeleponController,
//               decoration: const InputDecoration(labelText: 'No Telepon'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _confirmPasswordController,
//               decoration: const InputDecoration(labelText: 'Confirm Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _register(); // Menambahkan pemanggilan _register
//               },
//               child: const Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
// import 'dart:io';
// import 'dart:convert';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _EmailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _NamaLengkapController = TextEditingController();
//   final _NoTeleponController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _dateController = TextEditingController();
//   final _domisiliController = TextEditingController();

//   //For Gender
//   String? _selectedGender;

//   //check gender
//   bool _isValidGender(String gender) {
//     print('Selected Gender: $_selectedGender');
//   return gender == 'Male' || gender == 'Female' || gender == 'Other';
//   }

//   Future<void> _register() async {
//     String url;

//     if (kIsWeb) {
//     // Running on Web, use localhost
//     url = 'http://localhost/flutter/api/register.php';
//   } else if (Platform.isAndroid) {
//     // Running on Android, use local network IP
//     url = 'http://192.168.1.12/flutter/api/register.php';
//   } else {
//     // Default fallback (you can extend this for other platforms)
//     url = 'http://localhost/flutter/api/register.php';
//   }

//     final Email = _EmailController.text;
//     final password = _passwordController.text;
//     final NamaLengkap = _NamaLengkapController.text;
//     final NoTelepon = _NoTeleponController.text;
//     final confirmPassword = _confirmPasswordController.text;
//     final dateOfBirth = _dateController.text;
//     final domisili = _domisiliController.text;

//     if (password == confirmPassword) {
//       final response = await http.post(
//       Uri.parse(url),
//       headers: {"Content-Type": "application/json"},
//       body: json.encode({
//         'full_name': NamaLengkap,
//         'email': Email,
//         'gender': _selectedGender,
//         'date_of_birth': dateOfBirth,
//         'phone_number': NoTelepon,
//         'domisili': domisili,
//         'password': password,
//       }),
//     );
//       //Log response
//       print("Sending Data: ${{
//       'full_name': NamaLengkap,
//       'email': Email,
//       'gender': _selectedGender,
//       'date_of_birth': dateOfBirth,
//       'phone_number': NoTelepon,
//       'domisili': domisili,
//       'password': password,
//     }}");

//       final responseData = json.decode(response.body);

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(responseData["message"])),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error: ${responseData["message"]}")),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Passwords do not match')),
//       );
//     }
//       if (_selectedGender == null || !_isValidGender(_selectedGender!)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a valid gender')),
//       );
//       return;
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime selectedDate = DateTime.now();
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now(),
//     );

//     if (pickedDate != null && pickedDate != selectedDate) {
//       setState(() {
//         _dateController.text =
//             '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register Page'),
//       ),
//       resizeToAvoidBottomInset: true, 
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _NamaLengkapController,
//               decoration: const InputDecoration(labelText: 'Nama Lengkap'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _EmailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             const SizedBox(height: 16),
//             DropdownButton<String>(
//               value: _selectedGender,
//               items: <String>['Male', 'Female','Other']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedGender = newValue;
//                 });
//               },
//               hint: const Text('Pilih Gender'),
//             ),
//             const SizedBox(height: 16),
//             Text('Tanggal Lahir:', style: TextStyle(fontSize: 18)),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(
//                 hintText: 'Pilih Tanggal Lahir',
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.calendar_today),
//                   onPressed: () => _selectDate(context),
//                 ),
//               ),
//               readOnly: true,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _NoTeleponController,
//               decoration: const InputDecoration(labelText: 'No Telepon'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _domisiliController,  // Add Domisili TextField
//               decoration: const InputDecoration(labelText: 'Domisili'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _confirmPasswordController,
//               decoration: const InputDecoration(labelText: 'Confirm Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _register,
//               child: const Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required bool isPsychologist});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _EmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _NamaLengkapController = TextEditingController();
  final _NoTeleponController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _dateController = TextEditingController();
  final _domisiliController = TextEditingController();

  String? _selectedGender;

  Future<void> _register() async {
    String url;

    if (kIsWeb) {
      url = 'http://localhost/flutter/api/register.php';
    } else if (Platform.isAndroid) {
      url = 'http://192.168.1.12/flutter/api/register.php';
    } else {
      url = 'http://localhost/flutter/api/register.php';
    }

    final Email = _EmailController.text;
    final password = _passwordController.text;
    final NamaLengkap = _NamaLengkapController.text;
    final NoTelepon = _NoTeleponController.text;
    final confirmPassword = _confirmPasswordController.text;
    final dateOfBirth = _dateController.text;
    final domisili = _domisiliController.text;

    if (password == confirmPassword) {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'full_name': NamaLengkap,
          'email': Email,
          'gender': _selectedGender,
          'date_of_birth': dateOfBirth,
          'phone_number': NoTelepon,
          'domisili': domisili,
          'password': password,
        }),
      );
      
      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData["message"])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${responseData["message"]}")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
    }

    if (_selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a valid gender')),
      );
      return;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        _dateController.text =
            '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade300, // Soft purple theme
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Full Name Input
              _buildInputField(
                controller: _NamaLengkapController,
                label: 'Nama Lengkap',
              ),
              const SizedBox(height: 16),

              // Email Input
              _buildInputField(
                controller: _EmailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Gender Selection
              _buildGenderDropdown(),
              const SizedBox(height: 16),

              // Date of Birth
              _buildDatePicker(),
              const SizedBox(height: 16),

              // Phone Number Input
              _buildInputField(
                controller: _NoTeleponController,
                label: 'No Telepon',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // Domisili Input
              _buildInputField(
                controller: _domisiliController,
                label: 'Domisili',
              ),
              const SizedBox(height: 16),

              // Password Input
              _buildInputField(
                controller: _passwordController,
                label: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),

              // Confirm Password Input
              _buildInputField(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // Register Button
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Build Input Fields with a common style
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.deepPurple.shade50,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
    );
  }

  // Build Gender Dropdown
  Widget _buildGenderDropdown() {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Gender',
        fillColor: Colors.deepPurple.shade50,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedGender,
          isExpanded: true,
          hint: Text('Select Gender'),
          items: ['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
      ),
    );
  }

  // Build Date Picker for Date of Birth
  Widget _buildDatePicker() {
    return TextField(
      controller: _dateController,
      decoration: InputDecoration(
        labelText: 'Tanggal Lahir',
        hintText: 'Pilih Tanggal Lahir',
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context),
        ),
        fillColor: Colors.deepPurple.shade50,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      readOnly: true,
    );
  }

  // Register Button
  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _register,
      child: const Text('Register'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 162, 124, 227),
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }
}

