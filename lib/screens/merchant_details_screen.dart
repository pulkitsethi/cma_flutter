import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:cma_flutter/models/merchant.dart';

class MerchantDetailsScreen extends StatelessWidget {
  final _cards = allCards;
  final MerchantModel merchant;

  MerchantDetailsScreen({Key key, @required this.merchant}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, merchant, allCards),
      body: _buildList(context),
      persistentFooterButtons: _buildFooterButtons(),
    );
  }

  Widget _buildAppBar(
      BuildContext context, MerchantModel merchant, List<CardModel> cards) {
    return new AppBar(
      title: Text(merchant.name),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.message),
          tooltip: 'Feedback',
          onPressed: () {
            _showDialog(context);
          },
        )
    ]);
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) =>
          new AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            title: Text("How did we do?"))
    );
  }

  List<Widget> _buildFooterButtons() {
    Widget checkinStatus = new Text(
      'Are you here?',
      textDirection: TextDirection.ltr,
    );
    Widget checkinButton =
        new OutlineButton(child: new Text('CHECK IN'), onPressed: () {});
    return [checkinStatus, checkinButton];
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
        itemCount: allCards.length,
        itemBuilder: (context, i) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: _buildRow(context, _cards[i]));
        });
  }

  Widget _buildRow(BuildContext context, CardModel card) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: Icon(card.icon),
            title: Text(card.title),
            subtitle: Text(card.subtitle + ' ' + card.totalPoints.toString()),
          ),
          _createProgress(context, card)
        ],
      ),
    );
  }

  Widget _createProgress(BuildContext context, CardModel card) {
    Widget child;

    switch (card.progressType) {
      case ProgressType.punch:
        child = _createPunches(context, card);
        break;
      case ProgressType.points:
        child = _createPoints(context, card);
        break;
      default:
        child = null;
        print(card.progressType);
        break;
    }

    return child;
  }

  Widget _createPoints(BuildContext context, CardModel card) {
    double percent = card.points / card.totalPoints;

    return new LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - 50,
      lineHeight: 14.0,
      percent: percent,
      backgroundColor: Colors.grey,
      progressColor: Colors.green,
    );
  }

  Widget _createPunches(BuildContext context, CardModel card) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(card.totalPoints, (int index) {
        if (index < card.points) {
          return Icon(Icons.star);
        }
        return Icon(Icons.star_border);
      }),
    );
  }
}

class MerchantLocationModel {
  MerchantLocationModel({this.name, this.address});
  final String name;
  final String address;
}

enum ProgressType { punch, points }

class CardModel {
  CardModel(
      {this.title,
      this.subtitle,
      this.progressType,
      this.points,
      this.totalPoints,
      this.icon});
  final String title;
  final String subtitle;
  final int points;
  final int totalPoints;
  final IconData icon;
  final ProgressType progressType;
}

List<CardModel> allCards = [
  CardModel(
      title: 'Free Coffee',
      subtitle: 'When you buy',
      progressType: ProgressType.points,
      points: 1,
      totalPoints: 11,
      icon: Icons.free_breakfast),
  CardModel(
      title: 'Free Lunch Item',
      subtitle: 'When you buy',
      progressType: ProgressType.punch,
      points: 2,
      totalPoints: 11,
      icon: Icons.fastfood),
];
