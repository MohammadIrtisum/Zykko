// // uploading files to cloudinary
// import 'dart:convert';
// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import "package:http/http.dart" as http;
// import 'package:crypto/crypto.dart';
//  // For accessing device directories

// Future<bool> uploadToCloudinary(FilePickerResult? filePickerResult) async {
//   if (filePickerResult == null || filePickerResult.files.isEmpty) {
//     print("No file selected!");
//     return false;
//   }

//   File file = File(filePickerResult.files.single.path!);

//   String cloudName = "ds5p915uz"; //dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
//   print(cloudName);

//   // Create a MultipartRequest to upload the file
//   var uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/raw/upload");
//   var request = http.MultipartRequest("POST", uri);

//   // Read the file content as bytes
//   var fileBytes = await file.readAsBytes();

//   var multipartFile = http.MultipartFile.fromBytes(
//     'file', // The form field name for the file
//     fileBytes,
//     filename: file.path.split("/").last, //The file name to send in the request
//   );

//   // Add the file part to the request
//   request.files.add(multipartFile);

//   request.fields['upload_preset'] = "test-work";
//   request.fields['resource_type'] = "raw";

//   // Send the request and await the response
//   var response = await request.send();

//   // Get the response as text
//   var responseBody = await response.stream.bytesToString();

//   // Print the response
//   print(responseBody);

//   if (response.statusCode == 200) {
//     var jsonResponse = jsonDecode(responseBody);
//     Map<String, String> requiredData = {
//       "name": filePickerResult.files.first.name,
//       "id": jsonResponse["public_id"],
//       "extension": filePickerResult.files.first.extension!,
//       "size": jsonResponse["bytes"].toString(),
//       "url": jsonResponse["secure_url"],
//       "created_at": jsonResponse["created_at"],
//     };

//     // await DbService().saveUploadedFilesData(requiredData);
//     print("Upload successful!");
//     return true;
//   } else {
//     print("Upload failed with status: ${response.statusCode}");
//     return false;
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

Future<String?> uploadToCloudinary(FilePickerResult filePickerResult) async {
  File file = File(filePickerResult.files.single.path!);
  String extension = filePickerResult.files.single.extension!.toLowerCase();

  String cloudName = "ds5p915uz"; //dotenv.env['Cloudinary_Cloud_Name'] ?? '';
  String uploadPreset = dotenv.env['CLOUDINARY_UPLOAD_PRESET'] ?? 'test-work';

  // ✅ Detect file type (image or video)
  String resourceType = (extension == "mp4") ? "video" : "image";

  var uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/$resourceType/upload");
  var request = http.MultipartRequest("POST", uri);

  request.fields['upload_preset'] = uploadPreset;
  request.files.add(await http.MultipartFile.fromPath('file', file.path));

  var response = await request.send();
  var responseBody = await response.stream.bytesToString();

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(responseBody);
    print("✅ Upload Success: ${jsonResponse["secure_url"]}");
    return jsonResponse["secure_url"]; // 🔥 URL to save in Firebase
  } else {
    print("❌ Upload failed: ${response.statusCode} | $responseBody");
    return null;
  }
}
