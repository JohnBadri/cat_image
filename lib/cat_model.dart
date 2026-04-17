class CatImageModel {
  String? catImage;

  CatImageModel({required this.catImage});

  factory CatImageModel.fromJson(Map<String, dynamic> json) {
    return CatImageModel(
      catImage: json['url'],
    );
  }
}
