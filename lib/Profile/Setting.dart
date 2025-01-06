import 'package:flutter/material.dart';
import 'package:uts/Profile/Profile.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;
  bool _emailNotificationsEnabled = true;
  bool _smsNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 146, 63, 162),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Ganti Kata Sandi'),
            leading: Icon(Icons.lock),
            onTap: () {
              // Navigate to change password screen
            },
          ),
          ListTile(
            title: Text('Verifikasi Dua Langkah'),
            leading: Icon(Icons.security),
            onTap: () {
              // Navigate to 2FA settings screen
            },
          ),
          ListTile(
            title: Text('Notifikasi'),
            leading: Icon(Icons.notifications),
            onTap: () {
              _showNotificationSettings();
            },
          ),
          ListTile(
            title: Text('Privasi'),
            leading: Icon(Icons.privacy_tip),
            onTap: () {
              // Navigate to privacy settings
            },
          ),
          // ListTile(
          //   title: Text('Bahasa Aplikasi'),
          //   leading: Icon(Icons.language),
          //   onTap: () {
          //     // Change language setting
          //   },
          // ),
          ListTile(
            title: Text('Mode Gelap/Terang'),
            leading: Icon(Icons.brightness_6),
            trailing: Switch(
              value: _darkMode,
              onChanged: (bool value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Tentang Aplikasi'),
            leading: Icon(Icons.info),
            onTap: () {
              // Navigate to about screen
            },
          ),
          ListTile(
            title: Text('Keluar'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
        ],
      ),
    );
  }

  // Menampilkan pengaturan notifikasi
  void _showNotificationSettings() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pengaturan Notifikasi'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SwitchListTile(
                title: Text('Notifikasi Chat'),
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Notifikasi Email'),
                value: _emailNotificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _emailNotificationsEnabled = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Notifikasi SMS'),
                value: _smsNotificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _smsNotificationsEnabled = value;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
