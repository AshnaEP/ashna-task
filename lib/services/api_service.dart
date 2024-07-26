import 'dart:convert';
import 'package:assignment_task/models/api_model_class.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String apiUrl = 'https://chroniclingamerica.loc.gov/search/titles/results/?terms=oakland&format=json&page=1';

  static Future<ApiDataModel> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return ApiDataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}