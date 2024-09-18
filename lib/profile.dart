import 'package:flutter/material.dart';
import 'package:joker/constants/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorname,
        centerTitle: true,
        title: Text(
          "مطور التطبيق",
          style: TextStyle(
              fontFamily: 'Cairo',
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(shrinkWrap: true, children: [
        Container(
          height: h,
          width: w,
          color: Color.fromARGB(220, 224, 224, 224),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 32),
                child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/profile.jpg')),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text("م.أحمد العطاس",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            urlluncher(
                                Uri.parse('mailto:aahmedmohammed75@gmail.com'));
                          },
                          child: Text("aahmedmohammed75@gmail.com",
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.black,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold))),
                      Icon(
                        Icons.email,
                        color: colorname,
                        size: 30,
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 7),
                child: Text("مطور تطبيقات موبايل",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                  margin: EdgeInsets.only(top: 7, bottom: 10),
                  child: Text("Web Backend Dev ...",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15))),
              Container(
                decoration: BoxDecoration(
                  color: colorname,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'تواصل معي عبر حساباتي في مواقع التواصل الأجتماعي',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            urlluncher(Uri.parse(
                                "https://www.facebook.com/people/%D8%A3%D8%AD%D9%85%D8%AF-%D8%A7%D9%84%D8%B9%D8%B7%D8%A7%D8%B3/pfbid0k8TmdPYmUZrsdcN5crMQBcBuRWtgyJmn9eMQqTncFbC3ZjviVaaaSiNuAQkRpMpXl/?mibextid=ZbWKwL"));
                          },
                          child: ProdCard(
                            imagePath: FontAwesomeIcons.facebook,
                            name: "أحمد العطاس",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "https://api.whatsapp.com/send?phone=+967716226912"));
                          },
                          child: ProdCard(
                              imagePath: FontAwesomeIcons.whatsapp,
                              name: "716226912"),
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://www.instagram.com/ahmed_alattas910/?locale=nl&hl=af'));
                          },
                          child: ProdCard(
                              imagePath: FontAwesomeIcons.instagram,
                              name: "ahmed_alattas910"),
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "https://www.snapchat.com/add/a3ats?share_id=RcrITGti-zw&locale=ar-EG"));
                          },
                          child: ProdCard(
                              imagePath: FontAwesomeIcons.snapchat,
                              name: "a3ats"),
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse('tel:+967770985114'));
                          },
                          child: ProdCard(
                              imagePath: FontAwesomeIcons.phone,
                              name: "716226912/770985114"),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}

class ProdCard extends StatelessWidget {
  var imagePath;
  final String name;

  ProdCard({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$name",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Icon(
              imagePath,
              color: colorname,
            )
          ],
        ),
      ),
    );
  }
}
