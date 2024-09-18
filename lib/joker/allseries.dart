import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joker/constants/constant.dart';

import 'homepage.dart';

class allseries extends StatefulWidget {
  const allseries({super.key});
  static String id = 'allserics';

  @override
  State<allseries> createState() => _allseriesState();
}

class _allseriesState extends State<allseries> {
  Stream<QuerySnapshot> getseries() {
    CollectionReference Categories =
        FirebaseFirestore.instance.collection('series');

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
          'كل المسلسلات',
          style: textst,
        ),
      ),
      body: StreamBuilder(
        stream: getseries(),
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
