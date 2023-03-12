import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_comporator/comparator.dart';
import 'package:image_comporator/messages/messages.dart';
import 'package:image_picker/image_picker.dart';

/// A class that contains the state of the application
class ImageController extends ChangeNotifier {
  /// The first image file path
  final Map<int, File?> _images = {1: null, 2 : null};

  ///
  Map<int, File?> get images => _images;

  /// Compares the two images and returns a message
  String compare() {
    final message = compareImages(_images[1], _images[2]);
    
    return message;
  }

  /// Clears the selected images
  void clear() {
    _images.clear();
    notifyListeners();
  }

  /// Selects an image from the gallery
  /// and assigns it to the appropriate variable
  Future<void> pickImage(ImageSource source, int index) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: Messages.maxSize,
      maxWidth: Messages.maxSize,
    );
    if (pickedFile != null) {
      _images[index] = File(pickedFile.path);
      notifyListeners();
    }
  }
}
