import 'package:flutter/material.dart';
import 'package:phenomenaltechnic/utility/my_style.dart';
import 'package:phenomenaltechnic/widget/my_signout.dart';

class MyServiceTechnicial extends StatefulWidget {
  const MyServiceTechnicial({Key? key}) : super(key: key);

  @override
  _MyServiceTechnicialState createState() => _MyServiceTechnicialState();
}

class _MyServiceTechnicialState extends State<MyServiceTechnicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Technicial'),
        backgroundColor: MyStyle().darkenColor,
      ),
      drawer: Drawer(
        child: MySignout(),
      ),
    );
  }
}
