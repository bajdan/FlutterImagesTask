import 'package:first_test_task/model/image_model.dart';
import 'package:first_test_task/services/saved_images_storage.dart';
import 'package:flutter/material.dart';

Widget ImageWidget(ImageModel imageModel) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                imageModel.urlSmall,
              ),
              fit: BoxFit.cover),
        ),
      ),
      IconButton(
        onPressed: () {
          bool find = false;
          int deleteIndex = 0;
          for(int i=0; i<SavedImages.savedImages.length; i++){
            if (imageModel.id == SavedImages.savedImages.elementAt(i).id) {
              find = true;
              deleteIndex = i;
              break;
            }
          }
          if (!find) {
            SavedImages.savedImages.add(imageModel);
          }else{
            SavedImages.savedImages.removeAt(deleteIndex);
          }
        },
        icon: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      )
    ],
  );
}
