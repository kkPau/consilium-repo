import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mini_project/helper/helpers.dart';
import 'package:mini_project/widgets/com_num.dart';
import 'package:mini_project/widgets/detail_box.dart';

class AccountDetails extends StatelessWidget {
  static const routeName = '/account-details';
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userDetails = FirebaseFirestore.instance.collection('Users');

    Future<void> editField(String field) async {
      String newValue = '';
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Edit ${field}'),
              content: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary)),
                  hintText: 'Enter something',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                onChanged: (value) => newValue = value,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(newValue);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    )),
              ],
            );
          });

      if (newValue.trim().length > 0) {
        await userDetails.doc(currentUser!.email).update({field: newValue});
        FirebaseAuth.instance.currentUser!.updatePassword(newValue);
      }
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: Icon(
            Icons.person,
            size: 30,
          ),
          title: Text(
            'Account Details',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(currentUser!.email)
                .snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                final userData = snapshots.data!.data() as Map<String, dynamic>;
                return ListView(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Icon(
                      Icons.person,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      currentUser.email.toString(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'My Details',
                        style: TextStyle(fontSize: 25, color: Colors.grey[500]),
                      ),
                    ),
                    DetailsBox(
                      label: 'Username',
                      text: userData['username'],
                      onTap: () => editField('username'),
                    ),
                    DetailsBox(
                      label: 'My motivation',
                      text: userData['motivation'],
                      onTap: () => editField('motivation'),
                    ),
                    DetailsBox(
                      label: 'Update password',
                      text: userData['password'],
                      onTap: () {
                        editField('password');
                      },
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'My Posts',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildUserList(),
                  ],
                );
              } else if (snapshots.hasError) {
                return Center(
                  child: Text('Error${snapshots.error}'),
                );
              }
              return const Center(
                child: SpinKitPianoWave(
                  color: Colors.black,
                ),
              );
            }));
  }
}

Widget _buildUserList() {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('User Posts').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Wrap(
            children: [
              ...snapshot.data!.docs
                  .map<Widget>((doc) => _buildUserListItem(doc, context))
                  .toList(),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return SpinKitPianoWave(
          color: Colors.black,
        );
      });
}

Widget _buildUserListItem(DocumentSnapshot document, context) {
  void deletePost() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Post'),
            content: Text('Are you sure you want to delete this post'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () async {
                  final commentDoc = await FirebaseFirestore.instance
                      .collection('UserPosts')
                      .doc(document.id)
                      .collection('Comments')
                      .get();

                  for (var doc in commentDoc.docs) {
                    await FirebaseFirestore.instance
                        .collection('User Posts')
                        .doc(document.id)
                        .collection('Comments')
                        .doc(doc.id)
                        .delete();
                  }

                  FirebaseFirestore.instance
                      .collection('User Posts')
                      .doc(document.id)
                      .delete()
                      .then((value) => print('Post deleted'))
                      .catchError(
                          (error) => print('Failed to delete post: $error'));

                  Navigator.pop(context);
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }

  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  if (FirebaseAuth.instance.currentUser!.email == data['UserEmail']) {
    final List<String> likes = List<String>.from(data['Likes'] ?? []);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['UserEmail'],
                style: TextStyle(color: Colors.grey[600]),
              ),
              GestureDetector(
                onTap: () => deletePost(),
                child: Icon(
                  Icons.cancel,
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
          const SizedBox(height: 6),
          Container(
            width: MediaQuery.of(context).size.width - 90,
            child: Text(
              data['Message'],
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                formatDate(data['TimeStamp']),
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    likes.length.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ' Likes',
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  ComNum(postId: document.id),
                  Text(
                    ' Comments',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  } else {
    return Container();
  }
}
