import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  String? ipfsHash;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_image != null) {
      final fileBytes = await _image!.readAsBytes();
      final ipfsHashResponse = await uploadFile(fileBytes); // Call the uploadFile method from backend
      setState(() {
        ipfsHash = ipfsHashResponse;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload File')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick an Image'),
            ),
            if (_image != null) ...[
              Image.file(File(_image!.path)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _uploadFile,
                child: Text('Upload to IPFS'),
              ),
            ],
            if (ipfsHash != null) ...[
              Text('IPFS Hash: $ipfsHash'),
            ],
          ],
        ),
      ),
    );
  }
}

Future<String?> uploadFile(List<int> fileData) async {
  // Call your backend API here to upload to IPFS and return the IPFS hash
}
