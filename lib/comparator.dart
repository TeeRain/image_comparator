import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:image_comporator/messages/messages.dart';


///Comparator method
String compareImages(File? file1, File? file2) {

  if (file1 == null || file2 == null) {
    // return a message that u have not picked one or two images
    return Messages.resultEmpty;
  }
  final decoder = img.JpegDecoder();
  final bytes1 = file1.readAsBytesSync();
  final bytes2 = file2.readAsBytesSync();  
  final decodedImg1 = decoder.decodeImage(bytes1);
  final decodedImg2 = decoder.decodeImage(bytes2);

  if (decodedImg1 == null || decodedImg2 == null) {
    // return an error message
    return 'One or both images could not be decoded';
  }

  if (decodedImg1.width != decodedImg2.width ||
      decodedImg1.height != decodedImg2.height) {
    // return a message that images are not the same by size
    return Messages.resultSize;
  }

  for (int y = 0; y < decodedImg1.height; y++) {
    for (int x = 0; x < decodedImg1.width; x++) {
      final pixel1 = decodedImg1.getPixel(x, y);
      final pixel2 = decodedImg2.getPixel(x, y);
      if (pixel1 != pixel2) {
        // return a message that images are not the same by pixels
        return Messages.resultDiff;
      }
    }
  }

  return Messages.resultSame;
}
