import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phenomenaltechnic/models/user_model.dart';
import 'package:phenomenaltechnic/router.dart';

String initRoute = '/authen';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        // Login
        String uid = event.uid;
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .snapshots()
            .listen((event) {
          UserModel model = UserModel.fromMap(event.data()!);
          switch (model.typeuser) {
            case 'user':
              initRoute = '/myServiceUser';
              runApp(MyApp());
              break;
            case 'technicial':
              initRoute = '/myServiceTechnicial';
              runApp(MyApp());
              break;
            default:
              print('### No TypeUser ###');
              initRoute = '/authen';
              runApp(MyApp());
              break;
          }
        });
      } else {
        // Logout
        runApp(MyApp());
      }
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: initRoute,
    );
  }
}
