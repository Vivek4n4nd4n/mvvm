  import 'dart:convert';

import 'package:flutter_mvvm_demo/model/picsumdemo.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<PicsumDemo>> fetchPicturesAPI() async {
    String url = 'https://picsum.photos/v2/list';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200)
    {
      final json = jsonDecode(response.body)as List<dynamic>;
      final ListReselt=json.map((e) => PicsumDemo.fromJson(e)).toList();
      return ListReselt;
    }
    else
    throw Exception('Error fetching pictures');
  }
}
