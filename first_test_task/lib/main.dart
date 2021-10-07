import 'package:first_test_task/bloc/image_bloc.dart';
import 'package:first_test_task/pages/favorite_page.dart';
import 'package:first_test_task/pages/gallery_page.dart';
import 'package:first_test_task/services/image_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;
  final ImageRepository imageRepository = ImageRepository();
  final List<Widget> _widgetOptions = <Widget>[
    GalleryPage(),
    FavoritePage()
  ];

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
              unselectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Likes"),
              selectedColor: Colors.pink,
              unselectedColor: Colors.white,
            )
          ],
        ),
        body: BlocProvider<ImageBloc>(
          create: (context) => ImageBloc(imageRepository),
          child: _widgetOptions[_currentIndex],
        ),
      ),
    );
  }
}

