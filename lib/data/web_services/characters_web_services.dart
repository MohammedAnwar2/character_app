import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:character_app/constants/app_links.dart';
import 'package:http/http.dart' as http;

class CharactersWebServices {
  Future<List<dynamic>> getAllCharacters([int page = 1]) async {
    try {
      final uri = Uri.parse("${AppLinks.allCharacter}/?page=$page");
      var response = await http.get(uri).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> list = json.decode(response.body)['results'];
        return list;
      }
      throw 'no data';
    } on TimeoutException {
      throw 'No internet';
    } on SocketException {
      throw 'No internet';
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getMaxNumberOfPages() async {
    try {
      final uri = Uri.parse(AppLinks.allCharacter);
      var response = await http.get(uri);
      return json.decode(response.body)['info']['pages'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> searchCharacters({
    String? name,
    String? gender,
    String? status,
  }) async {
    try {
      http.Response response;

      final queryParameters = {
        if (name != null) 'name': name,
        if (gender != null) 'gender': gender,
        if (status != null) 'status': status,
      };
      final uri = Uri.parse(AppLinks.searchCharacter)
          .replace(queryParameters: queryParameters);
      response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body)['results'];
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
