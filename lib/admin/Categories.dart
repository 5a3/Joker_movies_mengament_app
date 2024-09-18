import 'package:flutter/material.dart';
import 'package:joker/componets/carditem.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> listcategories = ['مسلسلات', 'أفلام', 'إعلانات'];
  var cat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحة الفئات'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: listcategories.length,
        itemBuilder: (BuildContext context, int index) {
          return card_item(name: listcategories[index]);
        },
      ),
    );
  }
}
