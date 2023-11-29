import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllUsers extends StatelessWidget {
  static const routeName = 'all-users';
  const AllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Icon(Icons.people, size: 30,),
        title: Text('Users',),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                final user = snapshot.data!.docs[index];
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Theme.of(context).colorScheme.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(user.id),
                      Icon(Icons.chat),
                    ],
                  ),
                );
              }
            );
          }
          else if(snapshot.hasError){
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          }
          return SpinKitPianoWave(color: Colors.black,);
        }
      ),
    );
  }
}