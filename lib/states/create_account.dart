import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phenomenaltechnic/models/user_model.dart';
import 'package:phenomenaltechnic/utility/dialog.dart';
import 'package:phenomenaltechnic/utility/my_style.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double? screenWidth, screenHeight;
  String? typeUser, name, user, passWord;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ສະໝັກສະມາຊິກ',
          style: MyStyle().whiteStyle(),
        ),
        backgroundColor: MyStyle().darkenColor,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: MyStyle().gradientRadioBackground(),
          child: Stack(
            children: [
              buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Center buildContent() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildDisplayName(),
            buildTitle(),
            buildTypeUser(),
            buildTypeTechnicial(),
            buildUser(),
            buildPassword(),
            buildCreateAccount(),
          ],
        ),
      ),
    );
  }

  Container buildCreateAccount() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: screenWidth! * 0.75,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: MyStyle().redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if ((name?.isEmpty ?? true) ||
              (user?.isEmpty ?? true) ||
              (passWord?.isEmpty ?? true)) {
            // print('Have Space');
            normalDialog(context, 'Have Space ?', 'Please Fill Every Blank');
          } else if (typeUser == null) {
            normalDialog(context, 'No TypeUser',
                'Please Choose Type User by Click User or Technical');
          } else {
            createAccountAndInsertInformation();
          }
        },
        icon: Icon(Icons.perm_identity),
        label: Text('Create Account'),
      ),
    );
  }

  Future<Null> createAccountAndInsertInformation() async {
    await Firebase.initializeApp().then(
      (value) async {
        // print('### firebase Initialize Success user ==> $user, password ==> $passWord ##');
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: user!, password: passWord!)
            .then((value) async {
          // print('create Account Success');
          await value.user!.updateDisplayName(name).then((value1) async {
            print('Update Profile Success');
            String uid = value.user!.uid;
            print('Update Profile Success and uid = $uid');

            UserModel model =
                UserModel(email: user!, name: name!, typeuser: typeUser!);
            Map<String, dynamic> data = model.toMap();

            await FirebaseFirestore.instance
                .collection('user')
                .doc(uid)
                .set(data)
                .then((value) {
              print('Insert Value To Firestore Success');
              switch (typeUser) {
                case 'user':
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/myServiceUser', (route) => false);
                  break;
                case 'technicial':
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/myServiceTechnicial', (route) => false);
                  break;
                default:
              }
            });
          });
        }).catchError((onError) =>
                normalDialog(context, onError.code, onError.message));
      },
    );
  }

  Container buildTypeUser() {
    return Container(
      width: screenWidth! * 0.75,
      child: RadioListTile(
        value: 'user',
        groupValue: typeUser,
        onChanged: (value) {
          setState(() {
            typeUser = value as String?;
          });
        },
        title: Text(
          'User',
          style: MyStyle().whiteStyle(),
        ),
      ),
    );
  }

  Container buildTypeTechnicial() {
    return Container(
      width: screenWidth! * 0.75,
      child: RadioListTile(
        value: 'technicial',
        groupValue: typeUser,
        onChanged: (value) {
          setState(() {
            typeUser = value as String?;
          });
        },
        title: Text(
          'Technical',
          style: MyStyle().whiteStyle(),
        ),
      ),
    );
  }

  Container buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.75,
      child: Text(
        'Type User :',
        style: MyStyle().whiteStyle(),
      ),
    );
  }

  Container buildDisplayName() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.75,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.75),
          prefixIcon: Icon(
            Icons.fingerprint,
            color: MyStyle().redColor,
          ),
          hintStyle: MyStyle().redStyle(),
          hintText: 'Display Name :',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().redColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().primaryColor),
          ),
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.75,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.75),
          prefixIcon: Icon(
            Icons.perm_identity,
            color: MyStyle().redColor,
          ),
          hintStyle: MyStyle().redStyle(),
          hintText: 'User :',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().redColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().primaryColor),
          ),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.75,
      child: TextField(
        onChanged: (value) => passWord = value.trim(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.75),
          prefixIcon: Icon(
            Icons.lock_clock_outlined,
            color: MyStyle().redColor,
          ),
          hintStyle: MyStyle().redStyle(),
          hintText: 'Password :',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().redColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().primaryColor),
          ),
        ),
      ),
    );
  }
}
