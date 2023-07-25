import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chatgpt_app/constants/api_consts.dart';
import 'package:chatgpt_app/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print('jsonResponse["error"]: ${jsonResponse['error']['message']}');
        throw HttpException(jsonResponse['error']['message']);
      }

      // print('jsonResponse: $jsonResponse');
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        // print("temp ${value["id"]}");
      }

      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      print('error $error');
      rethrow;
    }
  }

  // mandar mensagem
  static Future<void> sendMessage({
    required String msg,
    required String modelId,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL/completions"),
        headers: {
          'Authorization': 'Bearer $API_KEY',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": modelId,
          "prompt": msg,
          "max_tokens": 100,
        }),
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      if (jsonResponse['choices'].length > 0) {
        print(
            "jsonResponse[choices]text ${jsonResponse['choices'][0]['text']}");
      }
    } catch (error) {
      print('error $error');
      rethrow;
    }
  }
}
