import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Counselors extends StatelessWidget {
  static const routeName = '/counselors';
  const Counselors({super.key});

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Icon(
          Icons.help,
          size: 30,
        ),
        title: Text(
          'Reach Out',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Remember, advice and counsel given on this platform is not a substitue for professional care',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BebasNeue-Regular',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Get Professional Help',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BebasNeue',
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Here are some professionals you can reach out to and get the best and quality mental health care you deserve',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Quicksand',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _listCon(
                  ListTile(
                    onTap: () => launchPhone('0553394255'),
                    textColor: Theme.of(context).colorScheme.primary,
                    titleTextStyle: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    title: Text('Mrs.Bernice Ofosuhene Peasah'),
                    subtitle: Text('Counselor, College of Science'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  [
                    Color.fromRGBO(249, 64, 1, 1),
                    Color.fromRGBO(249, 98, 9, 1),
                    Color.fromRGBO(244, 115, 11, 1),
                    Color.fromRGBO(246, 138, 6, 1),
                  ]),
              _listCon(
                  ListTile(
                    onTap: () => launchPhone('0244606579'),
                    textColor: Theme.of(context).colorScheme.primary,
                    titleTextStyle: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    title: Text('Ms. Akua Afriyie Addae'),
                    subtitle: Text(
                        'Counselor, College of Agric and Natural Resources'),
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
                    onTap: () => launchPhone('0243111923'),
                    textColor: Theme.of(context).colorScheme.primary,
                    titleTextStyle: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    title: Text('Ms. Joana Joseline Hackman'),
                    subtitle: Text('Counselor, College of Health Sciences'),
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
                    onTap: () => launchPhone('0242005566'),
                    textColor: Theme.of(context).colorScheme.primary,
                    titleTextStyle: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    title: Text('Mr. Gilbert Konwie Langu'),
                    subtitle:
                        Text('Counselor, College of Art and Built Environment'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  [
                    Color.fromRGBO(229, 106, 179, 1),
                    Color.fromRGBO(239, 135, 190, 1),
                    Color.fromRGBO(249, 163, 203, 1),
                    Color.fromRGBO(252, 188, 215, 1),
                  ]),
              _listCon(
                  ListTile(
                    onTap: () => launchPhone('0507496159'),
                    textColor: Theme.of(context).colorScheme.primary,
                    titleTextStyle: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    title: Text('Dr. Elizabeth Anokyewaa Sarfo Fordjour'),
                    subtitle: Text('Counselor, College of Engineering'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  [
                    Color.fromRGBO(46, 182, 44, 1),
                    Color.fromRGBO(87, 200, 77, 1),
                    Color.fromRGBO(131, 212, 117, 1),
                    Color.fromRGBO(171, 224, 152, 1),
                  ]),
              _listCon(
                  ListTile(
                    onTap: () => launchPhone('0559540176'),
                    textColor: Theme.of(context).colorScheme.primary,
                    titleTextStyle: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    title: Text('Mr. Rabbi Darko'),
                    subtitle: Text(
                        'Counselor, College of Humanities and Social Sciences'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  [
                    Color.fromRGBO(225, 212, 0, 1),
                    Color.fromRGBO(255, 221, 60, 1),
                    Color.fromRGBO(255, 234, 97, 1),
                    Color.fromRGBO(255, 241, 146, 1),
                  ]),
              _listCon(
                  ListTile(
                    onTap: () => launchPhone('0543797216'),
                    textColor: Theme.of(context).colorScheme.primary,
                    titleTextStyle: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    title: Text('Mr. Joseph Asamoah Gyawu'),
                    subtitle: Text('Counselor, Institute of Distance Learning'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  [
                    Color.fromRGBO(0, 0, 255, 1),
                    Color.fromRGBO(31, 31, 255, 1),
                    Color.fromRGBO(73, 73, 255, 1),
                    Color.fromRGBO(120, 121, 255, 1),
                  ]),
              _listCon(
                  ListTile(
                    onTap: () => launchPhone('0244759378'),
                    textColor: Theme.of(context).colorScheme.primary,
                    titleTextStyle: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    title: Text('Mr. Stephen Ofori'),
                    subtitle: Text('Counselor, Obuasi Campus'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  [
                    Color.fromRGBO(9, 9, 9, 1),
                    Color.fromRGBO(19, 19, 19, 1),
                    Color.fromRGBO(26, 26, 26, 1),
                    Color.fromRGBO(32, 32, 32, 1),
                  ]),
            ]),
          ),
        ),
      ),
    );
  }
}
