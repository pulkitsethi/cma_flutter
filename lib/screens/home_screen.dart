import 'package:flutter/material.dart';
import 'package:cma_flutter/models/merchant.dart';
import 'package:cma_flutter/screens/merchant_details_screen.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  final _merchants = allMerchants;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clover'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.separated(
        itemCount: allMerchants.length,
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

Random rnd = new Random();

List<MerchantModel> allMerchants = [
  MerchantModel(
      name: 'Peri-peri Original',
      address: '6456 Old Beulah St, Alexandria',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
  MerchantModel(
      name: 'Cheffelicano',
      address: '7890 Backlick Rd, Springfield',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
  MerchantModel(
      name: 'New York Cafe',
      address: '8253 Backlick Rd, Springfield',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
  MerchantModel(
      name: 'Shwarma Guys',
      address: '7011 Manchester Blvd Unit C, Alexandria',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
  MerchantModel(
      name: 'Milan Duda',
      address: '5960 Kingstowne Twn Ctr, Alexandria',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
  MerchantModel(
      name: 'Wavy Kickz',
      address: '6701 Loisdale Rd, Suite U, Springfield',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
  MerchantModel(
      name: 'Jewel Box',
      address: '6823 Springfield Town Ce, Springfield',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
  MerchantModel(
      name: 'Blue Monkey Vapes 113',
      address: '6500 Springfield Mall, Springfield',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
  MerchantModel(
      name: 'Perfect Eyebrows Springfield Kiosk',
      address: '6500 Springfield Mall # S1230, Springfield',
      color: Color.fromARGB(
          255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))),
];
