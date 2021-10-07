import 'package:first_test_task/bloc/image_event.dart';
import 'package:first_test_task/bloc/image_state.dart';
import 'package:first_test_task/model/image_model.dart';
import 'package:first_test_task/services/image_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState>{
  final ImageRepository imageRepository;

  ImageBloc(this.imageRepository) : super(ImageEmptyState());

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is ImageLoadEvent) {
      yield ImageLoadingState();
      try {
        final List<ImageModel> _loadedImageList = await imageRepository.getAllImages();
        yield ImageLoadedState(loadedUser: _loadedImageList);
      } catch (_) {
        yield ImageErrorState();
      }
    } else if (event is ImageClearEvent) {
      yield ImageEmptyState();
    }
  }
}