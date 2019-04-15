import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(icon: Icon(Icons.account_circle), onPressed: () {},)
          )
        ],
      ),
      body: null,
    );
  }
}