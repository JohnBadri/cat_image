import 'package:cat_image/cat_view.dart';
import 'package:cat_image/cat_view_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

final CatViewModel viewModel = CatViewModel();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CatView(viewModel: viewModel),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.getRandomImage();
          },
          child: const Icon(Icons.replay_outlined),
        ),
      ),
    );
  }
}
