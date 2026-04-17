import 'dart:convert';

import 'package:cat_image/cat_model.dart';
import 'package:http/http.dart' as http;

class CatURLService {
  Future<CatImageModel> getCatImage() async {
    final uri = Uri.https('api.thecatapi.com', 'v1/images/search');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return CatImageModel.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception(
        'Server was unable to be contacted, Status Code was ${response.statusCode}',
      );
    }
  }
}
