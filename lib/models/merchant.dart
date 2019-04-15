import 'package:flutter/material.dart';
import 'dart:math';

class MerchantModel {
  MerchantModel({this.name, this.address, this.color});
  final String name;
  final String address;
  final Color color;


  static List<MerchantModel> allMerchants = [
    MerchantModel(
        name: 'Peri-peri Original',
        address: '6456 Old Beulah St, Alexandria',
        color: generateRandomColor()),
    MerchantModel(
        name: 'Cheffelicano',
        address: '7890 Backlick Rd, Springfield',
        color: generateRandomColor()),
    MerchantModel(
        name: 'New York Cafe',
        address: '8253 Backlick Rd, Springfield',
        color: generateRandomColor()),
    MerchantModel(
        name: 'Shwarma Guys',
        address: '7011 Manchester Blvd Unit C, Alexandria',
        color: generateRandomColor()),
    MerchantModel(
        name: 'Milan Duda',
        address: '5960 Kingstowne Twn Ctr, Alexandria',
        color: generateRandomColor()),
    MerchantModel(
        name: 'Wavy Kickz',
        address: '6701 Loisdale Rd, Suite U, Springfield',
        color: generateRandomColor()),
    MerchantModel(
        name: 'Jewel Box',
        address: '6823 Springfield Town Ce, Springfield',
        color: generateRandomColor()),
    MerchantModel(
        name: 'Blue Monkey Vapes 113',
        address: '6500 Springfield Mall, Springfield',
        color: generateRandomColor()),
    MerchantModel(
        name: 'Perfect Eyebrows Springfield Kiosk',
        address: '6500 Springfield Mall # S1230, Springfield',
        color: generateRandomColor()),
  ];

  static Color generateRandomColor() {
    final Random rnd = new Random();
    return Color.fromARGB(255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256));
  }

}




