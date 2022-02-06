import 'package:flutter/material.dart';
import 'package:phenomenaltechnic/utility/my_style.dart';

Future<Null> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: MyStyle().showLogo(),
        title: Text(
          title,
          style: MyStyle().red2Style(),
        ),
        subtitle: Text(
          message,
          style: MyStyle().redStyle(),
        ),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Ok',
            style: MyStyle().redStyle(),
          ),
        ),
      ],
    ),
  );
}
