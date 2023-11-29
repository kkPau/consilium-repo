// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatelessWidget {
  static const routeName = '/delete-account';

  var delController = TextEditingController();
  String condel = 'I would like to delete my account';

  Future<void> delete(BuildContext context) async{
    try{
      final currentUser =  await FirebaseAuth.instance.currentUser;
      if(delController.text == condel){
        currentUser!.delete();
      }
      else{
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text('Error'),
            content: Text('Data is textfield does not match the string provided.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), 
                child: Text('Okay', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
              ),
            ],
          );
        });
      }
    } on FirebaseException catch(e){
      throw Exception(e.code);
    }
  }

  void del(BuildContext ctx){
    showDialog(context: ctx, builder: (ctx){
      return AlertDialog(
        title: Row(children: [
          Icon(Icons.warning),
          const SizedBox(width: 10,),
          Text('Caution'),
        ],),
        content: Text('Are you sure you want to delete your account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(), 
            child: Text('Cancel', style: TextStyle(color: Theme.of(ctx).colorScheme.secondary),)
          ),
          TextButton(
            onPressed: (){
              try{
                delete(ctx);
              }catch(e){
                showDialog(context: ctx, builder: (context){
                  return AlertDialog(
                    title: Text('Uh oh'),
                    content: Text(e.toString()),
                   );
                 });
              }
            }, 
            child: Text('Yes', style: TextStyle(color: Theme.of(ctx).colorScheme.secondary),),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: Icon(Icons.delete_forever),
        title: Text('Delete Account'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text('Please confirm the text you see below in the textfield below and tap the button to delete account', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
            SizedBox(height: 25,),
            Text('\'${condel}\'', style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 50),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
              controller: delController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                ),
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => del(context),
              child: Container(
                height: 50,
                width: 150,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Text(
                    'Delete Account', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}