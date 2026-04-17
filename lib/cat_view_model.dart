import 'package:cat_image/cat_model.dart';
import 'package:cat_image/cat_service.dart';
import 'package:flutter/material.dart';

class CatViewModel extends ChangeNotifier {
  final CatURLService service = CatURLService();
  CatImageModel? catImage;
  bool isLoading = false;
  String? errorMessage;

  CatViewModel();

  Future<void> getRandomImage() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      catImage = await service.getCatImage();
    } catch (e) {
      errorMessage = 'There was an error: ${e}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
