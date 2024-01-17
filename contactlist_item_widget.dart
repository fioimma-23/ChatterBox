import 'dart:convert';
import 'package:chat_app/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/post.dart';
// import 'api/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
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
      body: Container(
        child: Column(
            children: [
        Padding(
        padding: EdgeInsets.only(left: 16, top: 32),
        child: Text(
          "Invite",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
       Align(
         alignment: Alignment.centerLeft,
       child: Text(
        "My Contacts",
        style: TextStyle(
          fontSize: 20,
        )
       )
      ),
      Expanded(
        child: FutureBuilder<contactlist>(

          future: getposts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {

              final posts = snapshot.data!;
              return buildPosts(posts);
            } else {
              return const Center(child: Text("Error loading contacts"));

            }
          },
        ),
      ),
               // Padding(
               //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                 Align(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  alignment: Alignment.topRight,
                  child:
                    TextButton.icon(
                      onPressed: () {
                        // Handle share action
                      },
                      icon: Icon(Icons.share),
                      label: Text("Invite"),
                    ),

                   //],
                ),

            ],
        ),
      ),
    );
  }


  Widget buildPosts(contactlist posts) {

    return Padding(
        padding: EdgeInsets.only(top: 150),

      child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.result!.length,
      itemBuilder: (context, index) {
        final post = posts.result![index];
        return Container(
          color: Colors.white54,
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
            Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: Text(post.contactName!,
              style: TextStyle(
                color: Colors.black
            ))),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(post.contactID!,
                  style: TextStyle(
                      color: Colors.black,

                  ))),
            ],

          ),
            ),

        ],


          ),


        );
      }

      ),

    );
  }

}