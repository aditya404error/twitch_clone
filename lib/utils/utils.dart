import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<Uint8List?> imagePick() async {
  File? _image;
  final image = await ImagePicker().pickImage(source: ImageSource.camera);
  if (image == null) {
    print('null');
    return null;
  }
  final imageTemp = File(image.path);
  print(imageTemp.readAsBytes());
  return await imageTemp.readAsBytes();
}
