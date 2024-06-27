import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageProcessor {
  static Future<Map<String, dynamic>?> pickAndProcessImage(
      ImageSource imageSource, CropAspectRatio? aspectRatio) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if (pickedImage == null) return null;

      final originalFileSize = await File(pickedImage.path).length();

      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        aspectRatio: aspectRatio,
      );
      if (croppedFile == null) return null;

      final compressedImageBytes = await FlutterImageCompress.compressWithList(
          await croppedFile.readAsBytes());
      final compressedFileSize = compressedImageBytes.length;
      log("originalSize == ${originalFileSize / (1024 * 1024)} in Mb");
      log("compressedSize == ${compressedFileSize / (1024 * 1024)} in Mb");
      return {
        'file': Uint8List.fromList(compressedImageBytes),
        'type': pickedImage.mimeType,
        'name': pickedImage.name,
        'originalSize': originalFileSize,
        'compressedSize': compressedFileSize,
      };
    } catch (e) {
      print('Error picking or processing image: $e');
      return null;
    }
  }
}

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {

  Map<String, dynamic>? processedImage;

  Future<void> _pickAndProcessImage() async {
    final result = await ImageProcessor.pickAndProcessImage(
        ImageSource.gallery,
        const CropAspectRatio(ratioX: 1, ratioY: 1)); // You can pass CropAspectRatio if you want to crop the image, otherwise, pass null
    if (result != null) {
      setState(() {
        processedImage = result;

        //api me bhejne ke

        // FormData formData = FormData.fromMap({
        //   'image': await MultipartFile.fromBytes(processedImage?['file'],
        //     filename: 'image.jpg',
        //     contentType: MediaType('image', processedImage?['type']),
        //   ),
        // });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (processedImage != null)
              Image.memory(
                processedImage!['file'], // Display processed image
                width: 200,
                height: 200,
              ),
            ElevatedButton(
              onPressed: _pickAndProcessImage,
              child: const Text('Pick and Process Image'),
            ),
          ],
        ),
      ),
    );
  }
}
