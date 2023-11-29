// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/settings/counselors.dart';

import '../settings/all_users.dart';
import '../settings/delete_account.dart';
import '../settings/account_details.dart';
import '../settings/suicide_hotlines.dart';
import '../settings/terms_of_use.dart';

class SettingsTab extends StatelessWidget {
  Future<void> signout() async {
    return await FirebaseAuth.instance.signOut();
  }

  void logout(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Log Out'),
        content: Text('Are you sure you want to log out'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'No',
              style: TextStyle(color: Theme.of(ctx).colorScheme.secondary),
            ),
          ),
          TextButton(
            onPressed: () {
              signout();
              Navigator.of(ctx).pop(true);
              // FirebaseAuth.instance.signOut();
            },
            child: Text(
              'Yes',
              style: TextStyle(color: Theme.of(ctx).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }

  final settingController = TextEditingController();

  Widget buildContainer(BuildContext context, Widget list) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Row(
          children: [
            const Icon(
              Icons.settings,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Settings',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Account',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  buildContainer(
                    context,
                    Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AccountDetails.routeName);
                          },
                          leading: Icon(Icons.person),
                          title: Text(
                            'Account Details',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed(AllUsers.routeName);
                          },
                          leading: Icon(Icons.people_alt),
                          title: Text(
                            'All Users',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(DeleteAccount.routeName);
                          },
                          leading: Icon(Icons.delete_forever),
                          title: Text(
                            'Delete Account',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Help',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  buildContainer(
                    context,
                    Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Counselors.routeName);
                          },
                          leading: Icon(Icons.help),
                          title: Text(
                            'Reach out to Counselors',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SuicideHotlines.routeName);
                          },
                          leading: Icon(Icons.phone),
                          title: Text(
                            'Suicide Prevention Lines',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Others',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  buildContainer(
                      context,
                      Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(TermsOfUse.routeName);
                            },
                            leading: Icon(Icons.app_registration),
                            title: Text(
                              'Terms of use',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          // ListTile(
                          //   onTap: (){},
                          //   leading: Icon(Icons.app_registration),
                          //   title: Text('Privacy policy', style: Theme.of(context).textTheme.bodySmall,),
                          //   trailing: Icon(Icons.arrow_forward_ios),
                          // )
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () => logout(context),
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Log Out',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
