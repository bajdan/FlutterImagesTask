import 'package:first_test_task/services/saved_images_storage.dart';
import 'package:first_test_task/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: SavedImages.savedImages.length,
      itemBuilder: (context, index) {
        return ImageWidget(SavedImages.savedImages.elementAt(index));
      },
    );
  }
}
