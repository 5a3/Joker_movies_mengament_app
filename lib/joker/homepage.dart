import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joker/constants/constant.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:joker/joker/allmove.dart';
import 'package:joker/joker/allseries.dart';
import 'package:joker/joker/detiles.dart';
import 'package:joker/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Future urlluncher(url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    } catch (e) {
      return AlertDialog(
        title: Text('خطأ'),
        content: Text('حصل خطأ اثنا الانتقال'),
      );
    }
  }

  Stream<QuerySnapshot> getmovice() {
    CollectionReference Categories =
        FirebaseFirestore.instance.collection('movices');

    var data = Categories.orderBy('timestamp', descending: true).snapshots();

    return data;
  }

  Stream<QuerySnapshot> getseries() {
    CollectionReference Categories =
        FirebaseFirestore.instance.collection('series');

    var data = Categories.orderBy('timestamp', descending: true).snapshots();

    return data;
  }

  Stream<QuerySnapshot> getnews() {
    CollectionReference Categories =
        FirebaseFirestore.instance.collection('news');

    var data = Categories.orderBy('timestamp', descending: true).snapshots();

    return data;
  }

  var textst = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 226, 226, 226),
  );

  var listtiletxt = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.black);
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 198, 198, 198),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              height: 225,
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  accountName: Text('الجوكر',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 20,
                          color: colorname,
                          fontWeight: FontWeight.bold)),
                  accountEmail: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'حريضة/السوق/خلف مسجد الطالب',
                          style: TextStyle(fontFamily: 'Cairo', fontSize: 13),
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: colorname,
                      ),
                    ],
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.movie,
                color: colorname,
              ),
              title: Text('أفلام', style: listtiletxt),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllMoveies()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.movie_filter,
                color: colorname,
              ),
              title: Text('مسلسلات', style: listtiletxt),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => allseries()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.squareWhatsapp,
                color: colorname,
              ),
              title: Text('تواصل واتساب', style: listtiletxt),
              onTap: () {
                launchUrl(Uri.parse(
                    'https://api.whatsapp.com/send?phone=+967776703106'));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.phone,
                color: colorname,
              ),
              title: Text('إتصال', style: listtiletxt),
              onTap: () {
                launchUrl(Uri.parse('tel:+967776703106'));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.person_2_rounded,
                color: colorname,
              ),
              title: Text('مطور التطبيق', style: listtiletxt),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: colorname,
        title: Text(
          'الجوكر',
          style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: StreamBuilder(
                stream: getnews(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (snapshot.hasData) {
                    return SizedBox(
                      width: w - 20,
                      height: h / 4,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        // border: Border.all(color: colorname.withOpacity(1))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: AnotherCarousel(
                            dotSize: 2.0,
                            dotSpacing: 15.0,
                            dotColor: colorname,
                            indicatorBgPadding: 5.0,
                            dotBgColor: colorname.withOpacity(0.5),
                            borderRadius: true,
                            images: [
                              ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int i) {
                                  var news = snapshot.data!.docs[i];
                                  if (snapshot.hasData) {
                                    return Image.network(
                                      '${news['url']}',
                                      fit: BoxFit.fill,
                                    );
                                  }
                                  return Image.asset(
                                    'assets/images/name2.jpg',
                                    fit: BoxFit.fill,
                                  );
                                },
                              ),
                              Image.asset(
                                'assets/images/logo.jpg',
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                'assets/images/name2.jpg',
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AllMoveies.id);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 7,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  topLeft: Radius.circular(4)),
                              color: colorname),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "الكل",
                            style: textst,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white))),
                        child: Text(
                          'أحدث الأفلام',
                          style: textst,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            StreamBuilder(
              stream: getmovice(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("هناك خطأ : ${snapshot.error}"),
                  );
                }
                if (snapshot.hasData) {
                  return Container(
                    width: w,
                    height: h / 4 - 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int i) {
                          var move = snapshot.data!.docs[i];
                          return carditem(move: move);
                        },
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, allseries.id);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 7,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  topLeft: Radius.circular(4)),
                              color: colorname),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "الكل",
                            style: textst,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.white))),
                    child: Text(
                      'أحدث المسلسلات',
                      style: textst,
                    ),
                  ),
                )
              ],
            ),
            StreamBuilder(
              stream: getseries(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("هناك خطأ : ${snapshot.error}"),
                  );
                }
                if (snapshot.hasData) {
                  return Container(
                    width: w,
                    height: h / 4 - 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int i) {
                          var move = snapshot.data!.docs[i];
                          return carditem(move: move);
                        },
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class carditem extends StatelessWidget {
  const carditem({
    super.key,
    required this.move,
  });

  final QueryDocumentSnapshot<Object?> move;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => detiles2(imageurl: move['url']),
            )),
        child: Container(
            // height: 150,
            // width: 170,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 31, 31, 31)),
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: move['url'] != null
                        ? Image.network(
                            width: 170,
                            '${move['url']}',
                            fit: BoxFit.cover,
                          )
                        : CircularProgressIndicator(),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${move['title']}',
                            style: TextStyle(
                                fontFamily: 'Cairo', color: Colors.white),
                          ),
                        )))
              ],
            )),
      ),
    );
  }
}
