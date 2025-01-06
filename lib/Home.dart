// import 'package:flutter/material.dart';
// // import 'package:uts/Cerita.dart';
// import 'package:uts/Chat/Chat_Hall.dart';
// // import 'package:uts/Chat/chat.dart';
// import 'package:uts/Journal/ImportantMental.dart';
// import 'package:uts/Profile/Profile.dart';
// import 'package:uts/Konseling/KonselingList.dart';

// class PsyQApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {

//   Home(); 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('YuCare', style: TextStyle(fontFamily: 'Roboto', fontSize: 24)),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 250, 157, 255),
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Header
//             Container(
//               margin: EdgeInsets.all(16.0),
//               padding: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Profile()),
//                     );
//                   },
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       radius: 20.0, // Ukuran avatar
//                       backgroundImage: AssetImage(
//                         'assets/adoo.jpg', // Path gambar lokal
//                       ),
//                     ),
//                     title: Text(
//                       'Hai Luffy',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                   SizedBox(height: 8.0),
//                   ListTile(
//                     title: Text('Gimana kabar kamu hari ini?'),
//                     onTap: () {
//                       Navigator.pushNamed(context, '/status');
//                     },
//                   ),
//                   SizedBox(height: 16.0),
//                   EmojiSelection(),
//                 ],
//               ),
//             ),
//             // Konsultasi
//             Container(
//               margin: EdgeInsets.all(16.0),
//               padding: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 240, 186, 243),
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               child: Row(
//                 children: [
//                 Icon(Icons.psychology, size: 64, color: const Color.fromARGB(255, 236, 113, 232)),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: const [
//                             Text(
//                               'Konsul Kuyy!',
//                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             // SizedBox(width: 8.0),
//                             // Text('Ceritakan semua masalahmu dengan psikolog berkualitas'),
//                             // SizedBox(width: 8.0),
//                             // Text('Tambahan teks untuk menguji scroll horizontal'),
//                             // SizedBox(width: 8.0),
//                             // Text('Lebih banyak teks untuk memastikan scroll horizontal bekerja dan terlihat pada layar yang kecil'),
//                           ],
//                         ),
//                       ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Konseling()),
//                           );
//                         },
//                         child: Text('Pilih'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],

//               ),
//             ),

//             // Rekomendasi Journal
//             Container(
//             margin: EdgeInsets.all(16.0),
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 240, 186, 243),
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             child: Column(
//               children: [
//                 const Text(
//                   'Rekomendasi Journal',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 16.0),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal, // Mengaktifkan scroll horizontal
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => MentalHealthScreen()),
//                           );
//                         },
//                         child: const Column(
//                           children: [
//                             Icon(Icons.book, size:  48, color: Color.fromARGB(255, 0, 0, 0)),
//                             SizedBox(height: 8.0),
//                             Text('Kesehatan mental itu penting'),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 16.0), // Memberi jarak antar item
//                       const Column(
//                         children: [
//                           Icon(Icons.book_outlined, size: 48, color: Color.fromARGB(255, 0, 0, 0)),
//                           SizedBox(height: 8.0),
//                           Text('Pentingnya mengenal diri sendiri'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Konseling',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             label: 'Chat',
//           ),
//         ],
//         selectedItemColor: const Color.fromARGB(255, 105, 0, 96),
//         onTap: (index) {
//           switch (index) {
//             case 0:
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => Home()),
//               );
//               break;
//             case 1:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Konseling()),
//               );
//               break;
//             case 2:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ContactListScreen()),
//               );
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

// class EmojiSelection extends StatefulWidget {
//   @override
//   _EmojiSelectionState createState() => _EmojiSelectionState();
// }

// class _EmojiSelectionState extends State<EmojiSelection> {
//   IconData? _selectedEmoji;
//   String? _selectedMessage;

//   void _selectEmoji(IconData emoji, String message) {
//     setState(() {
//       _selectedEmoji = emoji;
//       _selectedMessage = message;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _selectedEmoji == null
//         ? ListTile(
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () => _selectEmoji(Icons.sentiment_very_dissatisfied, 'Very Dissatisfied'),
//                   child: Icon(Icons.sentiment_very_dissatisfied, size: 32),
//                 ),
//                 GestureDetector(
//                   onTap: () => _selectEmoji(Icons.sentiment_dissatisfied, 'Dissatisfied'),
//                   child: Icon(Icons.sentiment_dissatisfied, size: 32),
//                 ),
//                 GestureDetector(
//                   onTap: () => _selectEmoji(Icons.sentiment_neutral, 'Neutral'),
//                   child: Icon(Icons.sentiment_neutral, size: 32),
//                 ),
//                 GestureDetector(
//                   onTap: () => _selectEmoji(Icons.sentiment_satisfied, 'Satisfied'),
//                   child: Icon(Icons.sentiment_satisfied, size: 32),
//                 ),
//                 GestureDetector(
//                   onTap: () => _selectEmoji(Icons.sentiment_very_satisfied, 'Very Satisfied'),
//                   child: Icon(Icons.sentiment_very_satisfied, size: 32),
//                 ),
//               ],
//             ),
//           )
//         : ListTile(
//             title: Row(
//               children: [
//                 Icon(_selectedEmoji, size: 32),
//                 SizedBox(width: 8),
//                 Text(_selectedMessage!),
//               ],
//             ),
//           );
//   }
// }



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



import 'package:flutter/material.dart';
import 'package:uts/Chat/Chat_Hall.dart';
import 'package:uts/Journal/ImportantMental.dart';
import 'package:uts/Profile/Profile.dart';
import 'package:uts/Konseling/KonselingList.dart';

class PsyQApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('YuCare', style: TextStyle(fontFamily: 'Roboto', fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 170, 85, 255), // Soft purple color
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header - Greeting with Profile and Emotional Check-In
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Profile()),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage('assets/adoo.jpg'),
                      ),
                      title: Text(
                        'Hai Luffy',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ListTile(
                    title: Text('Gimana kabar kamu hari ini?'),
                    onTap: () {
                      Navigator.pushNamed(context, '/status');
                    },
                  ),
                  SizedBox(height: 16.0),
                  EmojiSelection(),
                ],
              ),
            ),
            // Konsultasi Section
            _buildSection(
              context,
              icon: Icons.psychology,
              iconColor: Colors.purpleAccent,
              sectionTitle: 'Konsul Kuyy!',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Konseling()),
                );
              },
            ),
            // Rekomendasi Journal Section
            _buildJournalRecommendations(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // Custom widget for Konsultasi Section
  Widget _buildSection(BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String sectionTitle,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 186, 243),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 64, color: iconColor),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sectionTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: onPressed,
                  child: Text('Pilih'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom widget for Journal Recommendations
  Widget _buildJournalRecommendations(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rekomendasi Journal',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildJournalCard(context, 'Kesehatan mental itu penting', Icons.book, Colors.deepPurple),
                SizedBox(width: 16.0),
                _buildJournalCard(context, 'Pentingnya mengenal diri sendiri', Icons.book_outlined, Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom widget for Journal Card
  Widget _buildJournalCard(BuildContext context, String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MentalHealthScreen()),
        );
      },
      child: Column(
        children: [
          Icon(icon, size: 48, color: color),
          SizedBox(height: 8.0),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
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
      selectedItemColor: const Color.fromARGB(255, 105, 0, 96),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Konseling()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactListScreen()),
            );
            break;
        }
      },
    );
  }
}

class EmojiSelection extends StatefulWidget {
  @override
  _EmojiSelectionState createState() => _EmojiSelectionState();
}

class _EmojiSelectionState extends State<EmojiSelection> {
  IconData? _selectedEmoji;
  String? _selectedMessage;

  void _selectEmoji(IconData emoji, String message) {
    setState(() {
      _selectedEmoji = emoji;
      _selectedMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _selectedEmoji == null
        ? ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _selectEmoji(Icons.sentiment_very_dissatisfied, 'Very Dissatisfied'),
                  child: Icon(Icons.sentiment_very_dissatisfied, size: 32),
                ),
                GestureDetector(
                  onTap: () => _selectEmoji(Icons.sentiment_dissatisfied, 'Dissatisfied'),
                  child: Icon(Icons.sentiment_dissatisfied, size: 32),
                ),
                GestureDetector(
                  onTap: () => _selectEmoji(Icons.sentiment_neutral, 'Neutral'),
                  child: Icon(Icons.sentiment_neutral, size: 32),
                ),
                GestureDetector(
                  onTap: () => _selectEmoji(Icons.sentiment_satisfied, 'Satisfied'),
                  child: Icon(Icons.sentiment_satisfied, size: 32),
                ),
                GestureDetector(
                  onTap: () => _selectEmoji(Icons.sentiment_very_satisfied, 'Very Satisfied'),
                  child: Icon(Icons.sentiment_very_satisfied, size: 32),
                ),
              ],
            ),
          )
        : ListTile(
            title: Row(
              children: [
                Icon(_selectedEmoji, size: 32),
                SizedBox(width: 8),
                Text(_selectedMessage!),
              ],
            ),
          );
  }
}
