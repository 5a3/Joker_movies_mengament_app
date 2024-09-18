import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:joker/admin/detiles.dart';
import 'package:joker/admin/edit.dart';

class customlisttile extends StatefulWidget {
  customlisttile(
      {super.key, this.name, this.move, this.num, this.data, this.id});
  QueryDocumentSnapshot? move;
  int? num;
  var data;
  var id;
  var name;

  @override
  State<customlisttile> createState() => _customlisttileState();
}

class _customlisttileState extends State<customlisttile> {
  @override
  Widget build(BuildContext context) {
    if (widget.num == 0 || widget.num == 1) {
      widget.num! + 1;
    }
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => detiles(move: widget.move),
            ));
      },
      child: Card(
        child: ListTile(
          leading: Image.network('${widget.move!['url']}'),
          title: Text('${widget.move!['title']}'.split('').join().toString()),
          // subtitle: Text('${widget.note!['text']}'.split('').join().toString()),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            edit(move: widget.move, name: widget.name),
                      ));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.warning,
                            color: Color.fromARGB(255, 245, 29, 13),
                          )),
                      content: Text(
                        "هل تريد حذف الفلم ${widget.move!['title']}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            try {
                              showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                              if ('${widget.move!['url']}'
                                  .startsWith('https://firebasestorage')) {
                                FirebaseStorage.instance
                                    .refFromURL(widget.move!['url'])
                                    .delete();
                              }
                              await FirebaseFirestore.instance
                                  .collection('${widget.name}')
                                  .doc(widget.move!.id)
                                  .delete();

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      'تم حذف الفلم ${widget.move!['title']}')));

                              Navigator.pop(context);
                              Navigator.pop(context);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('هناك خطاء ماء ${e}')));
                            }
                          },
                          child: Text('حذف'),
                        ),
                        TextButton(
                          onPressed: () {
                            // updateItem(item);
                            Navigator.pop(context);
                          },
                          child: Text('الغاء'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete, color: Colors.red),
            )
          ]),
        ),
      ),
    );
  }
}
