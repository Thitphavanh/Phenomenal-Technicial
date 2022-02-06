import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phenomenaltechnic/utility/my_style.dart';

class MySignout extends StatelessWidget {
  const MySignout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/authen', (route) => false));
            });
          },
          leading: Icon(
            Icons.exit_to_app,
            color: MyStyle().redColor,
            size: 40,
          ),
          title: Text(
            'Sign Out',
            style: MyStyle().red2Style(),
          ),
          tileColor: MyStyle().darkenColor,
        ),
      ],
    );
  }
}
