import 'package:flutter/material.dart';
import 'package:image_comporator/messages/messages.dart';
import 'package:image_comporator/state/image_controller.dart';
import 'package:image_comporator/widgets/image_holder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

/// The home page widget
class HomePage extends StatelessWidget {
  /// The home page constructor
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageController(),
      child: Builder(
        builder: (context) {
          final imageController = Provider.of<ImageController>(context);

          return Scaffold(
            appBar: AppBar(title: const Text(Messages.title)),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Messages.firstImageIndex,
                      Messages.secondImageIndex,
                    ]
                        .map(
                          (e) => ImageHolder(
                            img: imageController.images[e],
                            onTap: () => imageController.pickImage(
                                ImageSource.gallery, e,
                                ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: imageController.clear,
                      child: Text(Messages.clear.toUpperCase()),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final message = imageController.compare();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            content: Text(message),
                          ),
                        );
                      },
                      child: Text(Messages.compare.toUpperCase()),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
