// import 'dart:typed_data';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class StorageMethod {
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
  
//   Future<String> uploadImageToStorage(String childName, Uint8List file,bool isPost) async {

//    Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);

//    UploadTask uploadTask = ref.putData(file);
//    TaskSnapshot snap = await uploadTask;
//    String downloadUrl = await snap.ref.getDownloadURL();
//    return downloadUrl;

//     // Reference ref = FirebaseStorage.instance.ref().child(childName);
//     // UploadTask uploadTask = ref.putData(file);
//     // TaskSnapshot snap = await uploadTask;
//     // String downloadUrl = await snap.ref.getDownloadURL();
//     // return downloadUrl;
//   }
// }

// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class StorageMethod {
//   Future<String?> uploadToCloudinary(File file, {bool isVideo = false}) async {
//   String cloudName = "ds5p915uz";
//   String uploadPreset = "test-work";

//   String url = isVideo
//       ? "https://api.cloudinary.com/v1_1/$cloudName/video/upload"
//       : "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

//   var request = http.MultipartRequest("POST", Uri.parse(url));
//   request.fields["upload_preset"] = uploadPreset;
//   request.files.add(await http.MultipartFile.fromPath("file", file.path));

//   var response = await request.send();

//   if (response.statusCode == 200) {
//     final resStr = await response.stream.bytesToString();
//     final data = json.decode(resStr);
//     print("Cloudinary upload successful: $data");
//     return data["secure_url"]; // 🔥 Cloudinary file URL
//   } else {
//     print("Cloudinary upload failed: ${response.statusCode}");
//     return null;
    
//   }
// }

// }

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class CloudinaryStorageMethods {
  final String cloudName = "ds5p915uz";        // 🔥 Replace
  final String uploadPreset = "test-work"; // 🔥 Replace

  // upload image/video to Cloudinary
  Future<String> uploadToCloudinary(
    Uint8List fileBytes, {
    bool isVideo = false,
    bool isPost = false,
  }) async {
    try {
      // endpoint
      String url = isVideo
          ? "https://api.cloudinary.com/v1_1/$cloudName/video/upload"
          : "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

      // unique ID if post
      String publicId = isPost ? const Uuid().v1() : "default_${DateTime.now().millisecondsSinceEpoch}";

      // prepare multipart request
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.fields["upload_preset"] = uploadPreset;
      request.fields["public_id"] = publicId;
      request.files.add(http.MultipartFile.fromBytes(
        "file",
        fileBytes,
        filename: "$publicId.${isVideo ? "mp4" : "jpg"}",
      ));

      var response = await request.send();

      if (response.statusCode == 200) {
        final resStr = await response.stream.bytesToString();
        final data = json.decode(resStr);
        return data["secure_url"]; // 🔥 Cloudinary URL
      } else {
        throw Exception("Cloudinary upload failed: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Cloudinary error: $e");
    }
  }
}
