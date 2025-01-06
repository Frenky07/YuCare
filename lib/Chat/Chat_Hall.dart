// import 'package:flutter/material.dart';
// import 'package:uts/Chat/chat.dart';
// import 'package:uts/Home.dart';
// import 'package:uts/Konseling/KonselingList.dart';

// class _ContactListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: _ContactListScreen(),
//     );
//   }
// }

// class ContactListScreen extends StatefulWidget {
//   @override
//   _ContactListScreenState createState() => _ContactListScreenState();
// }

// class _ContactListScreenState extends State<ContactListScreen> {
//   final List<Map<String, String>> contacts = [
//     {'name': 'Alice', 'lastMessage': 'Halo, apa kabar?'},
//     {'name': 'Bob', 'lastMessage': 'Meeting jam 2 ya.'},
//     {'name': 'Charlie', 'lastMessage': 'Oke, sudah selesai.'},
//     {'name': 'David', 'lastMessage': 'Besok jalan yuk!'},
//     {'name': 'Eve', 'lastMessage': 'Terima kasih!'},
//     {'name': 'Frank', 'lastMessage': 'Selamat pagi.'},
//     {'name': 'Grace', 'lastMessage': 'Boleh, nanti aku cek.'},
//   ];

//   int currentIndex = 2; // Set initial index to 2 for Chat

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text("Daftar Kontak"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.separated(
//               itemCount: contacts.length,
//               separatorBuilder: (context, index) => Divider(),
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     child: Text(contacts[index]['name']![0]), // Huruf pertama nama
//                   ),
//                   title: Text(
//                     contacts[index]['name']!,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     contacts[index]['lastMessage']!,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             ChatScreen(contactName: contacts[index]['name']!),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex, // Use currentIndex to highlight selected tab
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
//         selectedItemColor: Colors.teal,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index; // Update the current index
//           });

//           switch (index) {
//             case 0:
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => Home()),
//               );
//               break;
//             case 1:
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => Konseling()),
//               );
//               break;
//             case 2:
//               // No need to navigate for Chat as we're already on it
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


import 'package:flutter/material.dart';
import 'package:uts/Chat/chat.dart';
import 'package:uts/Home.dart';
import 'package:uts/Konseling/KonselingList.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Map<String, String>> contacts = [
    {'name': 'Alice', 'lastMessage': 'Halo, apa kabar?'},
    {'name': 'Bob', 'lastMessage': 'Meeting jam 2 ya.'},
    {'name': 'Charlie', 'lastMessage': 'Oke, sudah selesai.'},
    {'name': 'David', 'lastMessage': 'Besok jalan yuk!'},
    {'name': 'Eve', 'lastMessage': 'Terima kasih!'},
    {'name': 'Frank', 'lastMessage': 'Selamat pagi.'},
    {'name': 'Grace', 'lastMessage': 'Boleh, nanti aku cek.'},
  ];

  int currentIndex = 2; // Set initial index to 2 for Chat

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Daftar Kontak",
          style: TextStyle( // Use default TextStyle here
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: contacts.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      contacts[index]['name']![0], // Display first letter of name
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    contacts[index]['name']!,
                    style: TextStyle( // Use default TextStyle for title
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    contacts[index]['lastMessage']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( // Use default TextStyle for subtitle
                      fontSize: 14.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(contactName: contacts[index]['name']!),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Use currentIndex to highlight selected tab
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Konseling()),
              );
              break;
            case 2:
              // No need to navigate for Chat as we're already on it
              break;
          }
        },
      ),
    );
  }
}
