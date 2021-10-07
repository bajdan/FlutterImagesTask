import 'package:first_test_task/model/image_model.dart';
import 'package:first_test_task/services/image_api_provider.dart';

class ImageRepository{
  final ImageProvider _imageProvider = ImageProvider();
  Future<List<ImageModel>> getAllImages() => _imageProvider.getImages();
}