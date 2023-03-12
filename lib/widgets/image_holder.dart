import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_comporator/messages/messages.dart';



///ImageHolder
class ImageHolder extends StatelessWidget {
  ///File for building ink well
  final File? img;
  ///on tap inkwell function
  final void Function() onTap;
  ///constructor
  const ImageHolder({
    Key? key,
    this.img,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _img = img;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      child: InkWell(
        key: const ValueKey('image'),
        onTap: onTap,
        child: _img == null
          ? Ink(
            color: const Color(0xFFD3D3D3),
            width: MediaQuery.of(context).size.width * Messages.widthFactor,
            height: MediaQuery.of(context).size.width * Messages.heightFactor,
            child: const Icon(Icons.add_a_photo),
          )
          : Image.file(
            _img,
            width: MediaQuery.of(context).size.width * Messages.widthFactor,
            height: MediaQuery.of(context).size.width * Messages.heightFactor,
            fit: BoxFit.cover,
          ),
      ),
    );
  }
}
