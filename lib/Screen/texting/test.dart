import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:meassage_app/resources/cloudinary_storage_method.dart';
import 'package:meassage_app/resources/storage_method.dart';

class TestWork extends StatefulWidget {
  const TestWork({super.key});

  @override
  State<TestWork> createState() => _TestWorkState();
}

class _TestWorkState extends State<TestWork> {
  FilePickerResult? _filePickerResult;

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'mp4'],
      type: FileType.custom,
    );
    setState(() {
      _filePickerResult = result;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Picker Example'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
              setState(() {
                _filePickerResult = null;
              });
              },
              child: Text('Cancel'),
            ),
            SizedBox(width: 20),
            // ElevatedButton(onPressed: ()async{
            //   final result = await uploadToCloudinary(_filePickerResult!);
            //   if(result){
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Upload successful!'))
            //     );
            //   } else {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Upload failed!'))
            //     );
            //   }
            // }, child: Text("upload"))
            
            // ElevatedButton(
            //   onPressed: () async {
            //    _openFilePicker();
            //   if (_filePickerResult != null) {
            //     final result = await uploadToCloudinary(_filePickerResult!);
            //     if (result) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Upload successful!')),
            //     );
            //     } else {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Upload failed!')),
            //     );
            //     }
            //   } else {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(content: Text('No file selected!')),
            //     );
            //   }
            //   },
            //   child: Text('Pick a File'),
            // ),
            // SizedBox(height: 20),
            // _filePickerResult != null
            //     ? Text('Selected file: ${_filePickerResult!.files.single.name}')
            //     : Text('No file selected.'),

  ElevatedButton(
  onPressed: () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'mp4'],
      type: FileType.custom,
    );

    if (result != null) {
      String? url = await uploadToCloudinary(result);
      if (url != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload successful! URL saved: $url')),
        );

        // TODO: save `url` in Firebase here
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed!')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected!')),
      );
    }
  },
  child: Text("Pick & Upload"),
),
  //  SizedBox(height: 20),
            _filePickerResult != null
                ? Text('Selected file: ${_filePickerResult!.files.single.name}')
                : Text('No file selected.'),
               
          ],
        ),
      ),
    );
  }
}