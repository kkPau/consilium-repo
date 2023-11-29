import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class SuicideHotlines extends StatelessWidget {
  static const routeName = '/suicide-hotline';
  const SuicideHotlines({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> launchPhone(String conNum) async {
      final Uri _phone = Uri(scheme: 'tel', path: conNum);
      try {
        if (await canLaunchUrl(_phone)) {
          await launchUrl(_phone);
        }
      } catch (error) {
        throw ('Cannot dial');
      }
    }

    Widget _listCon(Widget child, List<Color> color) {
      return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: color),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Icon(
          Icons.help_center,
          size: 30,
        ),
        title: Text(
          'Get Help',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/images/quote1.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/images/quote.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Suicide is never an option',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BebasNeue'),
              textAlign: TextAlign.center,
            ),
            Text(
              'You don\'t have to go through this alone',
              style: TextStyle(fontSize: 18, fontFamily: 'Quicksand'),
              textAlign: TextAlign.center,
            ),
            Text(
              'Reach out to these numbers and get the help you need',
              style: TextStyle(fontSize: 18, fontFamily: 'Quicksand'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _listCon(
                ListTile(
                  textColor: Theme.of(context).colorScheme.primary,
                  onTap: () => launchPhone('988'),
                  style: ListTileStyle.drawer,
                  title: Text('988 Lifeline Center'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                [
                  Color.fromRGBO(9, 9, 9, 1),
                  Color.fromRGBO(19, 19, 19, 1),
                  Color.fromRGBO(26, 26, 26, 1),
                  Color.fromRGBO(32, 32, 32, 1),
                ]),
            _listCon(
                ListTile(
                  textColor: Theme.of(context).colorScheme.primary,
                  onTap: () => launchPhone('0244471279'),
                  style: ListTileStyle.drawer,
                  title: Text('National Lifeline'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                [
                  Color.fromRGBO(85, 37, 134, 1),
                  Color.fromRGBO(106, 53, 156, 1),
                  Color.fromRGBO(128, 79, 179, 1),
                  Color.fromRGBO(153, 105, 199, 1),
                ]),
            _listCon(
                ListTile(
                  textColor: Theme.of(context).colorScheme.primary,
                  onTap: () => launchPhone('0509914046'),
                  style: ListTileStyle.drawer,
                  title: Text('Mental Health Authority'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                [
                  Color.fromRGBO(26, 138, 184, 1),
                  Color.fromRGBO(26, 140, 184, 1),
                  Color.fromRGBO(26, 148, 184, 1),
                  Color.fromRGBO(26, 156, 184, 1),
                ]),
            _listCon(
                ListTile(
                  textColor: Theme.of(context).colorScheme.primary,
                  onTap: () => launchPhone('0206814666'),
                  style: ListTileStyle.drawer,
                  title: Text('Mental Health Authority'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                [
                  Color.fromRGBO(249, 64, 1, 1),
                  Color.fromRGBO(249, 98, 9, 1),
                  Color.fromRGBO(244, 115, 11, 1),
                  Color.fromRGBO(246, 138, 6, 1),
                ]),
          ],
        ),
      ),
    );
  }
}
