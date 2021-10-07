abstract class ImageState {}
class ImageEmptyState extends ImageState {}

class ImageLoadingState extends ImageState {}

class ImageLoadedState extends ImageState {
  List<dynamic> loadedUser;
  ImageLoadedState({required this.loadedUser}) : assert(loadedUser.isNotEmpty);
}

class ImageErrorState extends ImageState {}