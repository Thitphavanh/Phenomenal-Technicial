import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phenomenaltechnic/utility/my_style.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double? screenWidth, screenHeight;
  bool redEye = true;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: buildCreateAccount(),
      body: Container(
        decoration: MyStyle().gradientRadioBackground(),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            behavior: HitTestBehavior.opaque,
            child: Stack(
              children: [
                MyStyle().buildBackground(screenWidth!, screenHeight!),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      buildUser(),
                      buildPassword(),
                      buildSignInEmail(),
                      buildSignInGoogle(),
                      buildSignInFacebook(),
                      buildSignInTwitter(),
                      buildSignInApple(),
                      buildSignInGitHub(),
                      SizedBox(height: screenHeight! * 0.1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 50),
        Text(
          'Non Account ?',
          style: MyStyle().redStyle(),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/createAccount'),
          child: Text(
            'Create Account',
            style: MyStyle().blue2Style(),
          ),
        ),
      ],
    );
  }

  Container buildSignInEmail() => Container(
        margin: EdgeInsets.only(top: 8),
        width: screenWidth! * 0.75,
        child: SignInButton(
          Buttons.Email,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  Container buildSignInGoogle() => Container(
        margin: EdgeInsets.only(top: 8),
        width: screenWidth! * 0.75,
        child: SignInButton(
          Buttons.GoogleDark,
          onPressed: () => processSingInWithGoogle(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  Future<Null> processSingInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    await Firebase.initializeApp().then((value) async{
      await _googleSignIn.signIn().then((value) {
        print('Login With gmail Success');
      });
    });

  }

  Container buildSignInFacebook() => Container(
        margin: EdgeInsets.only(top: 8),
        width: screenWidth! * 0.75,
        child: SignInButton(
          Buttons.FacebookNew,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  Container buildSignInTwitter() => Container(
        margin: EdgeInsets.only(top: 8),
        width: screenWidth! * 0.75,
        child: SignInButton(
          Buttons.Twitter,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  Container buildSignInApple() => Container(
        margin: EdgeInsets.only(top: 8),
        width: screenWidth! * 0.75,
        child: SignInButton(
          Buttons.Apple,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  Container buildSignInGitHub() => Container(
        margin: EdgeInsets.only(top: 8),
        width: screenWidth! * 0.75,
        child: SignInButton(
          Buttons.GitHub,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.75,
      child: TextField(
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
            borderSide: BorderSide(color: MyStyle().blueColor),
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
        obscureText: redEye,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.75),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                redEye = !redEye;
              });
            },
            icon: redEye
                ? Icon(
                    Icons.remove_red_eye,
                    color: MyStyle().redColor,
                  )
                : Icon(
                    Icons.remove_red_eye_outlined,
                    color: MyStyle().blueColor,
                  ),
          ),
          prefixIcon: Icon(
            Icons.lock_clock_outlined,
            color: MyStyle().redColor,
          ),
          hintStyle: MyStyle().redStyle(),
          hintText: 'Password :',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().blueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().primaryColor),
          ),
        ),
      ),
    );
  }
}
