import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Gatitos/models/cat_model.dart';

class CatProvider {
  String _url = 'api.thecatapi.com';
  String _api_key =
      'live_mcwGebtrOoyL9hbpWE8Iin8EC0QpbzCjg3clI1Dj0pSUShpELIdmu6DhubWHH6Jt';
  int _limit = 10;

  List<Cat> _cats = [];

  // Método que hace peticion a la api catApi
  Future<List<Cat>> getCats() async {
    // Creamos la URL de la peticion
    final url = Uri.https(_url, '/v1/images/search',
        {'api_key': _api_key, 'limit': _limit.toString(), 'has_breeds': '1'});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cats = Cats.fromJsonList(decodedData);
    final allCatsFutures = cats.items.map((cat) => getCatInfo(cat)).toList();
    final allCatsLists = await Future.wait(allCatsFutures);
    return allCatsLists;
  }

  Future<Cat> getCatInfo(Cat cat) async {
    final allInfoUrl = Uri.https(_url, '/v1/images/${cat.id}');

    // Obtener resp
    final resp = await http.get(allInfoUrl);
    final decodedData = json.decode(resp.body);
    final catAllInfo = Cat.fromJsonMap(decodedData);

    return catAllInfo;
  }

  //   Future<List<Cat>> getRandomCats() async {
  //   final url = Uri.https(_url, '/v1/images/search',
  //       {'limit': _limit.toString(), 'order': 'RANDOM'});
  //   final resp = await http.get(url, headers: {'x-api-key': _api_key});
  //   final decodedData = json.decode(resp.body);
  //   final cats = Cats.fromJsonList(decodedData);
  //   return cats;
  // }
}
