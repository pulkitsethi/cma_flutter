import 'package:flutter/material.dart';
import 'package:cma_flutter/models/merchant.dart';
import 'package:cma_flutter/screens/merchant_details_screen.dart';
import 'package:cma_flutter/screens/profile_screen.dart';


class HomeScreen extends StatelessWidget {
  final _merchants = MerchantModel.allMerchants;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildList(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Clover'),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ))
      ],
    );
  }

  Widget _buildList() {
    return ListView.separated(
        itemCount: _merchants.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, i) {
          return _buildRow(context, _merchants[i]);
        });
  }

  Widget _buildRow(BuildContext context, MerchantModel merchant) {
    return ListTile(
      leading: Icon(Icons.store, color: merchant.color),
      title: Text(merchant.name),
      subtitle: Text(merchant.address),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MerchantDetailsScreen(merchant: merchant)));
      },
    );
  }
}

