import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class detiles extends StatefulWidget {
  detiles({super.key, this.move});
  QueryDocumentSnapshot? move;

  @override
  State<detiles> createState() => _detilesState();
}

class _detilesState extends State<detiles> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.move!['title'])),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .3,
                width: double.infinity,
                child: Image.network(
                  widget.move!['url'],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
                child: Row(
                  children: [
                    Icon(Icons.bookmark_add_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'الفلم او المسلسل',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black12,
                thickness: 1.0,
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, right: 20, left: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ' ${widget.move!['title']} : اسم الفلم او رقمه هو ',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
