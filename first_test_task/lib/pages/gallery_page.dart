import 'package:first_test_task/bloc/image_bloc.dart';
import 'package:first_test_task/bloc/image_event.dart';
import 'package:first_test_task/bloc/image_state.dart';
import 'package:first_test_task/services/image_repository.dart';
import 'package:first_test_task/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageBloc imageBloc = BlocProvider.of<ImageBloc>(context);

    return BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
      if (state is ImageEmptyState) {
        imageBloc.add(ImageLoadEvent());
        return const Center(child: CircularProgressIndicator());
      }

      if (state is ImageLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is ImageLoadedState) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index){
              return ImageWidget(state.loadedUser.elementAt(index));
            });
      }

      if (state is ImageErrorState) {
        return const Center(
          child: Text(
            'Error fetching users',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
