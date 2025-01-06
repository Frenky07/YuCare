import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uts/LoginPage/Login.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'FUltter layout demo';
    return MaterialApp(
      title: appTitle,
      // home: Home(),
      home: LoginPage(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:uts/services/api_services.dart';
// import 'services/api_services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: UserList(),
//     );
//   }
// }

// class UserList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User List')),
//       body: FutureBuilder<List<dynamic>>(
//         future: ApiService.fetchUsers(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No users found.'));
//           } else {
//             final users = snapshot.data!;
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final user = users[index];
//                 return ListTile(
//                   title: Text(user['full_name']),
//                   subtitle: Text(user['email']),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
