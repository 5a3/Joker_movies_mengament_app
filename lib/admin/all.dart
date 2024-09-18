import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joker/admin/addmov.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../componets/carditem.dart';
import '../componets/customlisttile.dart';

class all extends StatefulWidget {
  QueryDocumentSnapshot? move;
  all({
    super.key,
    this.move,
    this.namecategory,
  });
  var namecategory;
  static String id = 'all';

  @override
  State<all> createState() => _allState();
}

var cat;

class _allState extends State<all> {
  final searchcontroller = TextEditingController();

  Stream<QuerySnapshot> getall(String textsearch) {
    if (widget.namecategory == 'أفلام') {
      cat = 'movices';
    } else if (widget.namecategory == 'مسلسلات') {
      cat = 'series';
    } else if (widget.namecategory == 'إعلانات') {
      cat = 'news';
    }
    if (textsearch == '') {
      var note = FirebaseFirestore.instance
          .collection('${cat}')
          .orderBy('timestamp', descending: true);
      var data = note.snapshots();
      return data;
    } else {
      var note = FirebaseFirestore.instance
          .collection('${cat}')
          // .where('title', isEqualTo: '${searchcontroller}')
          .orderBy('timestamp', descending: true);

      var data = note.snapshots();
      return data;
    }
  }

  // QueryDocumentSnapshot? noteflotion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addmov(name: cat),
                  ));
            }),
        appBar: AppBar(
          // automaticallyImplyLeading: false,

          title: Text('${widget.namecategory}'),
        ),
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                  searchcontroller.text = value;
                },
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الحقل مطلوب';
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: StreamBuilder<QuerySnapshot>(
              stream: getall(searchcontroller.text),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('خطا: ${snapshot.error}'));
                }
                //var note = snapshot.data!.docs;

                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int i) {
                      var move = snapshot.data!.docs;

                      return customlisttile(
                        name: cat,
                        move: move[i],
                      );
                    },
                  );
                  // return card_item(
                  //     data: note[i], id: note[i].id, name: note[i]['title']);
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ]));
  }
}
