// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class PictScreenCamera extends StatefulWidget {
  const PictScreenCamera({super.key});
  @override
  State<PictScreenCamera> createState() => _PictScreenCameraState();
}

class _PictScreenCameraState extends State<PictScreenCamera> {
  late File _image ;


// ---------------------------
File image = File("assets/images/logo.png");
Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
// .--------------------
  
  // get image from camera
  Future openCamera() async{
    var image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
    );

    setState(() {
      _image = image as File;
      //  _image = File(image!.path);    
    });
  }
  // open app in gallery
  Future openGallery()async {
    var imageFromGallery = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = imageFromGallery as File;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galerry Image"),),
      body: Center(
        child: _image == null ? const Text("No Image Exist"):Image.file(_image)
      ),

    floatingActionButton: FloatingActionButton(onPressed: pickImage, child: Icon(Icons.add_a_photo),),
    );
  }
}