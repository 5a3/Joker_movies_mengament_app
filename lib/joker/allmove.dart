import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joker/constants/constant.dart';

import 'homepage.dart';

class AllMoveies extends StatefulWidget {
  const AllMoveies({super.key});
  static String id = 'allmove';

  @override
  State<AllMoveies> createState() => _AllMoveiesState();
}

class _AllMoveiesState extends State<AllMoveies> {
  var txtstyle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 226, 226, 226),
  );

  Stream<QuerySnapshot> getmovice() {
    CollectionReference Categories =
        FirebaseFirestore.instance.collection('movices');

    var data = Categories.orderBy('timestamp', descending: true).snapshots();

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: colorname,
        title: Text(
          'كل الأفلام',
          style: txtstyle,
        ),
      ),
      body: StreamBuilder(
        stream: getmovice(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('هناك خطأ : ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 0.5),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int i) {
                var move = snapshot.data!.docs[i];
                return carditem(
                  move: move,
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
