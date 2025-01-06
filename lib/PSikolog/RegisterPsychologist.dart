import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPsychologistPage extends StatefulWidget {
  @override
  _RegisterPsychologistPageState createState() => _RegisterPsychologistPageState();
}

class _RegisterPsychologistPageState extends State<RegisterPsychologistPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _graduationYearController = TextEditingController();
  File? _selectedIjazah;

  Future<void> _pickIjazah() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedIjazah = File(pickedFile.path);
      });
    }
  }

  void _register() {
    // Simpan data psikolog dan unggah ke server
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final university = _universityController.text;
    final graduationYear = _graduationYearController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || university.isEmpty || graduationYear.isEmpty || _selectedIjazah == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field wajib diisi, termasuk ijazah.')),
      );
      return;
    }

    // Implementasi unggah data ke server di sini
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pendaftaran berhasil, data sedang diproses.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar sebagai Psikolog'),
        backgroundColor: Colors.purple.shade300,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                prefixIcon: Icon(Icons.person, color: Colors.purple.shade400),
                filled: true,
                fillColor: Colors.purple.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Email
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

            // Password
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
            const SizedBox(height: 16),

            // Instansi Tempat Kuliah
            TextField(
              controller: _universityController,
              decoration: InputDecoration(
                labelText: 'Nama Universitas',
                prefixIcon: Icon(Icons.school, color: Colors.purple.shade400),
                filled: true,
                fillColor: Colors.purple.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tahun Lulus
            TextField(
              controller: _graduationYearController,
              decoration: InputDecoration(
                labelText: 'Tahun Lulus',
                prefixIcon: Icon(Icons.date_range, color: Colors.purple.shade400),
                filled: true,
                fillColor: Colors.purple.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Unggah Ijazah
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickIjazah,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Unggah Ijazah'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 224, 145, 238),
                  ),
                ),
                const SizedBox(width: 16),
                if (_selectedIjazah != null) const Text('Ijazah terpilih!'),
              ],
            ),
            const SizedBox(height: 16),

            // Tombol Daftar
            Center(
              child: ElevatedButton(
                onPressed: _register,
                child: const Text('Daftar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
