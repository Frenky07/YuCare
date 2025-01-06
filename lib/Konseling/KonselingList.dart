import 'package:flutter/material.dart';
import 'package:uts/Chat/Chat_Hall.dart';
import 'package:uts/Chat/chat.dart';
import 'package:uts/Home.dart';
import 'package:uts/Payment/Pay.dart';
import 'package:uts/PsikoBio/BioProfil.dart';

class Konseling extends StatefulWidget {
  @override
  _KonselingState createState() => _KonselingState();
}

class _KonselingState extends State<Konseling> {
  int currentIndex = 1; // Menetapkan indeks awal ke Konseling (index 1)

  final List<Map<String, String?>> counselors = [
    {
      'name': 'Lalu Tedy Adiatma',
      'status': 'Online',
      'skill': 'menguasai 4 elemen',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Muhammad alvin Firdaus',
      'status': 'Online',
      'skill': 'ahlinya teleportasi',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Frenky',
      'status': 'Online',
      'skill': 'Mampu berkomunikasi dengan hewan, jin dan malaikat',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Jericho Emili Mahgaguna',
      'status': 'Not Available',
      'skill': 'membuat angka imajiner bisa berhayal',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Konseling'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 230, 231, 250),
            child: Text(
              'Dapatkan kualitas terbaik untuk layanan konseling tanpa dipungut biaya sama sekali. Jika anda baru pertama kali menggunakan jasa kami.',
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: counselors.length,
              itemBuilder: (context, index) {
  final counselor = counselors[index];
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(counselor['image'] ??
            'https://via.placeholder.com/150'),
      ),
      title: Text(
        counselor['name'] ?? 'Tidak diketahui',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Keahlian: ${counselor['skill'] ?? 'Tidak tersedia'}'),
          SizedBox(height: 4.0),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: counselor['status'] == 'Online'
                    ? Colors.green
                    : Colors.red,
                size: 12.0,
              ),
              SizedBox(width: 4.0),
              Text(counselor['status'] ?? 'Unknown'),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CounselorProfile(),
          ),
        );
      },
    ),
  );
},

            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Set current index
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Konseling',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        selectedItemColor: Colors.teal,
        onTap: (index) {
          setState(() {
            currentIndex = index; // Update the current index
          });

          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
              break;
            case 1:
              // Keep on the current page if Konseling is selected
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactListScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}
