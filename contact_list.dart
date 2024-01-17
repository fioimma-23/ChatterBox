import 'dart:convert';
import 'package:chat_app/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../api/post.dart';
import '../../chat_window_screen/chat_window_screen.dart';
import 'package:image_picker/image_picker.dart';
// import 'api/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Contact(),
      debugShowCheckedModeBanner: false,
    );
  }
}



class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}


class _ContactState extends State<Contact> {
  ImagePicker _imagePicker = ImagePicker();
  late String _selectedImagePath = ImageConstant.imgCamera;

  Future<contactlist> getposts() async {
    var url = Uri.parse("https://localhost:7057/api/ChatterBox/getChatContacts?Userid=9498372305");

    final response = await http.get(url);



    if (response.statusCode == 200) {

      var data = json.decode(response.body);

      contactlist contactList = contactlist.fromJson(data);

      return contactList;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(


        child: FutureBuilder<contactlist>(

          future: getposts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {

              final posts = snapshot.data!;
              return buildPosts(posts);
            } else {

              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }


  Widget buildPosts(contactlist posts) {

    // return Padding(
    //   padding: EdgeInsets.only(top: 150),
    //
    //   child:
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: posts.result!.length,
          itemBuilder: (context, index) {
            final post = posts.result![index];
            return Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 100,
              width: double.maxFinite,

              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:30 ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgCamera,
                      height: 30.v,
                      width: 28.h,
                      radius: BorderRadius.circular(28.h),
                      margin: EdgeInsets.only(bottom: 9.v),
                      onTap: () async {
                        PickedFile? pickedFile = (await _imagePicker.pickImage(source: ImageSource.camera)) as PickedFile?;
                        if (pickedFile != null) {
                          setState(() {
                            _selectedImagePath = pickedFile.path;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(

                          context,
                          MaterialPageRoute(builder: (context) => ChatWindowScreen(name: '', userId: '',)),
                        );
                      },

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3, child: Text(post.contactName!,
                            style: TextStyle(
                                color: Colors.black
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
    );
  }

}

