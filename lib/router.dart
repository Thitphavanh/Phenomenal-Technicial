import 'package:flutter/material.dart';
import 'package:phenomenaltechnic/states/authen.dart';
import 'package:phenomenaltechnic/states/create_account.dart';
import 'package:phenomenaltechnic/states/my_service_technicial.dart';
import 'package:phenomenaltechnic/states/my_service_user.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/myServiceUser': (BuildContext context) => MyServiceUser(),
  '/myServiceTechnicial': (BuildContext context) => MyServiceTechnicial(),
};
