import 'dart:convert';

import 'package:first_test_task/model/image_model.dart';
import 'package:http/http.dart' as http;

class ImageProvider{
  Future<List<ImageModel>> getImages() async {
    final response = await http.get(Uri.parse('https://api.unsplash.com/photos/?client_id=0a_G2wFH08PfRW-x58Ek5Uc6xO2Yx71nOezNFKeaOoE'));

    if(response.statusCode==200){
      final List<dynamic> imageJson = json.decode(response.body);
      return imageJson.map((json) => ImageModel.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}