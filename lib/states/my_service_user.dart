import 'package:flutter/material.dart';
import 'package:phenomenaltechnic/utility/my_style.dart';
import 'package:phenomenaltechnic/widget/my_signout.dart';

class MyServiceUser extends StatefulWidget {
  const MyServiceUser({Key? key}) : super(key: key);

  @override
  _MyServiceUserState createState() => _MyServiceUserState();
}

class _MyServiceUserState extends State<MyServiceUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome User'),
        backgroundColor: MyStyle().darkenColor,
      ),drawer: Drawer(
        child: MySignout(),
      ),
    );
  }
}
