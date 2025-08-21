import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//   pickImage(ImageSource source) async {
//   final ImagePicker _imagePicker = ImagePicker();
//   XFile?_file =  await _imagePicker.pickImage(source: source);
//   if( _file == null){
//     // return File ("_file.path");
//     return await _file?.readAsBytes();
//   }
//   print("NO Image Selected");
// }

class ImagePickerr {
  Future<File>uploadImage(String inputSource) async {
    final picker = ImagePicker();
    final XFile? pickerImage  = await picker.pickImage(
      source: inputSource == "camera" ? ImageSource.camera : ImageSource.gallery
    );
    File imageFile = File(pickerImage!.path);
    return imageFile;
  }
}
   