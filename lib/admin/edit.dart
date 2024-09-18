import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joker/componets/custombutton.dart';
import 'package:joker/componets/customtextformfiled.dart';
import 'package:image_picker/image_picker.dart';

class edit extends StatefulWidget {
  edit({super.key, this.move, this.name});
  static String id = 'EditNote';
  QueryDocumentSnapshot? move;
  var name;

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  File? file;
  var url;
  getimage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      var imagename = path.basename(image.path);
      var refstorge = FirebaseStorage.instance.ref(imagename);
      await refstorge.putFile(file!);
      url = await refstorge.getDownloadURL();
      setState(() {});
    } else {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    title.text = widget.move!['title'];
  }

  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  TextEditingController title = new TextEditingController();

  Future<dynamic> editmove() async {
    if (formkey.currentState!.validate()) {
      try {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
        CollectionReference move =
            FirebaseFirestore.instance.collection('${widget.name}');
        Map<String, dynamic> body = {
          'url': url ??
              '${'https://toppng.com/uploads/preview/colored-sticky-note-png-11552182116p9e7shymq0.png'}',
          'title': '${title.text}',
          'timestamp': FieldValue.serverTimestamp(),
        };

        var res =
            await move.doc(widget.move!.id).set(body, SetOptions(merge: true));
        // print(widget.move!.id);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(' تم تعديل الفلم ${title.text} بنجاح')));
        Navigator.pop(context);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text('حصل خطاء ماء الرجاء اعادة المحاولة ${e}')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الفلم'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الحقل مطلوب';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'أدخل عنوان الفلم',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                MaterialButton(
                    color: Colors.blueAccent,
                    child: Text(
                      'تغيير الصورة',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      getimage();
                    }),
                MaterialButton(
                    color: Colors.blueAccent,
                    child: Text(
                      'تعديل',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      editmove();
                    }),
                if (file != null)
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.file(file!),
                  )
                else
                  Container(
                    child: Text(
                      'يمكنك تعديل  صورة الفلم',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
