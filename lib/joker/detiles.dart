import 'package:flutter/material.dart';
import 'package:joker/constants/constant.dart';

class detiles2 extends StatefulWidget {
  detiles2({super.key, this.imageurl});
  var imageurl;

  @override
  State<detiles2> createState() => _detiles2State();
}

class _detiles2State extends State<detiles2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 120,
              child: Image.network(
                '${widget.imageurl}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 7,
            child: CircleAvatar(
              backgroundColor: colorname,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_sharp),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
