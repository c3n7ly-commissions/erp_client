import 'package:flutter/material.dart';

class AppBarBuilder {
  static AppBar generate({String title = 'ERP'}) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 40),
          child: Tooltip(
            message: 'Log out',
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.power_settings_new_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
