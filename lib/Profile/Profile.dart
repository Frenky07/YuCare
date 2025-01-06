// import 'package:flutter/material.dart';
// import 'package:uts/Chat/Chat_Hall.dart';
// import 'package:uts/Home.dart';
// import 'package:uts/Konseling/KonselingList.dart';
// import 'package:uts/LoginPage/Login.dart';
// import 'package:uts/Profile/EditBio.dart';
// import 'package:uts/Profile/Setting.dart';

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Profile'),
//       //   backgroundColor: Colors.purple[100],
//       // ),
//       body: Center(
//         child: ConstrainedBox(
//           constraints: BoxConstraints.expand(
//             height: 600.0,
//             width: 600,
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16.0),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 6.0,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Foto Profil
//                 CircleAvatar(
//                   radius: 50.0, // Ukuran avatar
//                   backgroundImage: AssetImage(
//                     'assets/adoo.jpg', // Path gambar lokal
//                   ),
//                   child: CircleAvatar(
//                     radius: 50.0, // Adjust the radius as needed
//                     backgroundColor: Colors.black.withOpacity(0.5),
//                     child: Stack(
//                       children: const [
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Icon(
//                             Icons.camera_alt_rounded,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 // Nama
//                 const Text(
//                   'Ado Ado',
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 2.0),
//                 //Email
//                 const Text(
//                   'AdoAdo@gmail.com',
//                   style: TextStyle(
//                     fontSize: 12.0,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Column(
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.brush),
//                       title: Text('Akun Personal'),
//                       onTap: () {
//                         Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => EditBio(email: '',)),
//                       );
//                       },
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.settings),
//                       title: Text('Settings'),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Setting()),
//                         );
//                       },
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.help),
//                       title: Text('Help'),
//                       onTap: () {
//                       },
//                     ),
//                     SizedBox(height: 5.0),
//                     ListTile(
//                       leading: Icon(Icons.logout, color: Colors.red),
//                       title: Text('Log Out', style: TextStyle(color: Colors.red)),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => LoginPage()),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
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


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



import 'package:flutter/material.dart';
import 'package:uts/Chat/Chat_Hall.dart';
import 'package:uts/Home.dart';
import 'package:uts/Konseling/KonselingList.dart';
import 'package:uts/LoginPage/Login.dart';
import 'package:uts/Profile/EditBio.dart';
import 'package:uts/Profile/Setting.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurpleAccent, // More professional purple tone
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: 650.0,
            width: 650.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture with a professional look
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/adoo.jpg'),  // Path to profile picture
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.white.withOpacity(0.6),
                      child: Icon(Icons.camera_alt_rounded, color: Colors.deepPurpleAccent, size: 18.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Name
                const Text(
                  'Ado Ado',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4.0),
                // Email
                const Text(
                  'AdoAdo@gmail.com',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16.0),
                // Profile Menu List
                Column(
                  children: [
                    _buildProfileMenuItem(context, Icons.brush, 'Akun Personal', EditBio(email: '')),
                    _buildProfileMenuItem(context, Icons.settings, 'Settings', Setting()),
                    _buildProfileMenuItem(context, Icons.help, 'Help', null),
                    const SizedBox(height: 10.0),
                    _buildLogoutItem(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Colors.deepPurpleAccent,  // Consistent purple selection
        unselectedItemColor: Colors.black54,  // Subtle unselected item color
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
      ),
    );
  }

  // Helper function to build profile menu items
  Widget _buildProfileMenuItem(BuildContext context, IconData icon, String title, Widget? destination) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurpleAccent),
      title: Text(title, style: TextStyle(fontSize: 16.0, color: Colors.black87)),
      onTap: destination != null ? () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      } : null,
    );
  }

  // Helper function to build logout item
  Widget _buildLogoutItem(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout, color: Colors.redAccent),
      title: Text('Log Out', style: TextStyle(color: Colors.redAccent, fontSize: 16.0)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
  }
}


