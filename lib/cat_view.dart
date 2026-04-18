import 'package:cat_image/cat_view_model.dart';
import 'package:flutter/material.dart';

class CatView extends StatefulWidget {
  final CatViewModel viewModel;

  const CatView({super.key, required this.viewModel});

  @override
  State<CatView> createState() => _CatViewState();
}

class _CatViewState extends State<CatView> {
  late final CatViewModel viewModel = widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.getRandomImage();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, child) {
        {
          if (viewModel.isLoading) {
            return CircularProgressIndicator();
          }
          if (viewModel.theCat == null) {
            return Text(viewModel.errorMessage ?? "No image loaded");
          }
          return Image.network(viewModel.theCat!.catImage!);
        }
      },
    );
  }
}
