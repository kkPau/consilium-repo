import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsOfUse extends StatelessWidget {
  static const routeName = '/terms-of-use';
  const TermsOfUse({super.key});

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

    Future<void> launchMail(String emailto) async {
      final Uri _email = Uri(scheme: 'mailto', path: emailto);
      try {
        if (await canLaunchUrl(_email)) {
          await launchUrl(_email);
        }
      } catch (error) {
        throw ('Cannotlaunch email');
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.app_registration,
          color: Theme.of(context).colorScheme.primary,
          size: 30,
        ),
        title: Text('TERMS OF USE',
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Effective Date: July 15, 2023',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Please read these Terms of Use carefully before accessing or using Consilium. This constitutes a legal agreement between you and Consilium and by accessing the App, you agree to be bounded by these Terms otherwise you may not use the App.',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 20),
                Text(
                  '1. App Description and Use',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        'The App provides online counseling services, information, and resources for personal growth, mental health support, and well-being. The App is intended for informational and educational purposes only and should not be considered a substitute for professional advice or treatment.',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'The App allows Users to connect with other Users and also Counselors to get the necessary counseling service they require. Users can share their story and get to comment on other user\'s posts, providing support. Users can also reach out to other Users through the app\'s chat feature so as to provide help confidentially.',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'You understand and agree that any information or advice provided by other Users or Counselors is not a substitute for professional medical, psychological or psychiatric diagnosis, treatment or advice. You should always seek the advice of qualified professionals regarding any mental health concerns or conditions.',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '2. User Eligibility',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        'You must be at least 18 years old or have the legal capacity to enter into a binding agreement to use the App. By using the App, you represent and warrant that you meet these eligibility requirements.',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'You are required to create an account to use the App. You are responsible for maintaining the confidentiality of your account credentials and for any activities that occur under your account.',
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '3. App Content and Intellectual Property',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        'The App and all its content, including but not limited to text, graphics, logos, images, videos, and software, are owned by Karikari-Apau Kenneth. You may not reproduce, distribute, modify, or create derivative works based on the App or its content without our prior written consent.',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'You retain ownership of any content you submit or post on the App. By submitting User Content, you grant us a non-exclusive, royalty-free, worldwide, perpetual, and irrevocable license to use, reproduce, distribute, modify, display, and perform the User Content in connection with the App.',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '4. App Usage Guidelines',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        'You agree to use the App in compliance with applicable laws and these Terms. You must not use the App in any way that is unlawful, harmful, defamatory, offensive, or infringing of intellectual property rights.',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'You are solely responsible for your use of the App, including any actions, content, or information you provide or transmit. You must not impersonate others, interfere with the App\'s functionality, or engage in any conduct that may disrupt or harm the App or its users.',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '5. Privacy and Data Protection',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        'We are committed to protecting your privacy and handling your personal information in accordance with applicable privacy laws.',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'We cannot guarantee the security of the App or the confidentiality of any information transmitted through the App. You are responsible for taking precautions to protect your information.',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '6. Disclaimer of Warranties and Limitation of Liability',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        'The App is provided on an "as is" and "as available" basis, without warranties of any kind, whether express or implied. We do not guarantee that the App will be error-free or uninterrupted or that it will meet your specific requirements.',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'To the maximum extent permitted by law, we shall not be liable for any direct, indirect, incidental, consequential, or special damages arising out of or in connection with your use of the App, including but not limited to damages for loss of profits, goodwill, data, or other intangible losses.',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '7. Changes to the Terms',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        'We may update these Terms from time to time at our discretion. Any changes will be effective upon posting the revised Terms on the App. Your continued use of the App after the changes indicates your acceptance of the revised Terms.',
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '8. General Provisions',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        'These Terms constitute the entire agreement between you and us regarding the use of the App and supersede any prior agreements or understandings.',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'If any provision of these Terms is found to be invalid or unenforceable, the remaining provisions shall continue to be valid and enforceable to the fullest extent permitted by law.',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Text.rich(
                //   TextSpan(
                //       text:
                //           'If you have any questions or concerns about these Terms, please contact us at ',
                //       style: TextStyle(fontSize: 20),
                //       children: [
                //         TextSpan(
                //           text: '0552387144',
                //           style: TextStyle(
                //             decoration: TextDecoration.underline,
                //             fontFamily: 'BebasNeue',
                //             fontSize: 20,
                //           ),
                //         ),
                //       ]),
                // ),
                Text(
                  'If you have any questions or concerns about these Terms, please contact us at ',
                  style: TextStyle(fontSize: 20),
                ),
                _listCon(
                    ListTile(
                      textColor: Theme.of(context).colorScheme.primary,
                      leading: Icon(
                        Icons.phone,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text('Phone'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => launchPhone('0552387144'),
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
                      leading: Icon(
                        Icons.email,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text('Email'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => launchMail('karikarikenneth8@gmail.com'),
                    ),
                    [
                      Color.fromRGBO(9, 9, 9, 1),
                      Color.fromRGBO(19, 19, 19, 1),
                      Color.fromRGBO(26, 26, 26, 1),
                      Color.fromRGBO(32, 32, 32, 1),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
