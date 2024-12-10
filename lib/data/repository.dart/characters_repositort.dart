import 'package:character_app/data/models/characters_model/CharactersModel.dart';
import 'package:character_app/data/web_services/characters_web_services.dart';

class CharactersRepositort {
  final CharactersWebServices charactersWebServices;
  CharactersRepositort({required this.charactersWebServices});

  Future<List<CharactersModel>> getAllCharacters([int page = 1]) async {
    try {
      List<dynamic> list = await charactersWebServices.getAllCharacters(page);
      List<CharactersModel> charactersModelList =
          list.map((e) => CharactersModel.fromJson(e)).toList();
      return charactersModelList;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getMaxNumberOfPages() async {
    return await charactersWebServices.getMaxNumberOfPages();
  }

  Future<List<CharactersModel>> searchCharacters(
      {String? name, String? gender, String? status}) async {
    try {
      List<dynamic> list = await charactersWebServices.searchCharacters(
          name: name, gender: gender, status: status);
      List<CharactersModel> charactersModelList =
          list.map((e) => CharactersModel.fromJson(e)).toList();
      return charactersModelList;
    } catch (e) {
      rethrow;
    }
  }
}
