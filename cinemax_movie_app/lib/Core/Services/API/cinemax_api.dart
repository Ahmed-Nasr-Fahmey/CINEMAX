import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static String apiKey = '18f61101df5fd650bac827fad79fea74';
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String imageBaseUrl = 'https://image.tmdb.org/t/p/original';
  static String youTubeVideoBaseUrl = 'https://www.youtube.com/watch?v=';
  static Future<List<dynamic>> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      return jsonData['results'];
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception(
          'There is Problem (In Client Side) with Status Code. => ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      throw Exception(
          'There is Problem (In Server Side) with Status Code. => ${response.statusCode}');
    } else {
      throw Exception(
          'There is Problem with Status Code. => ${response.statusCode}');
    }
  }
}
