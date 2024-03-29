import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Gatitos/models/cat_model.dart';


class CatProvider {
  String _url = 'api.thecatapi.com';
  String _api_key =
      'live_zgo9DGLDog9TiXkY4yyrGPUvOnbTna0ehs8um61BZlDsiXYU6NzVLP4wCb6Zobd0';
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

  Future<List<Cat>> getRandomCats() async {
    final url = Uri.https(_url, '/v1/images/search',
        {'api_key': _api_key, 'limit': _limit.toString(), 'order': 'RANDOM'});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cats = Cats.fromJsonList(decodedData);

    final allCatsFutures = cats.items.map((cat) => getCatInfo(cat)).toList();
    final allCatsLists = await Future.wait(allCatsFutures);
    return allCatsLists;
  }

  Future<List<Cat>> searchCatsByName(String name) async {
    final url =
        Uri.https(_url, '/v1/breeds/search', {'api_key': _api_key, 'q': name});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cats = Cats.fromJsonList(decodedData);

    final allCatsFutures = cats.items.map((cat) => getCatInfo(cat)).toList();
    final allCatsLists = await Future.wait(allCatsFutures);
    return allCatsLists;
  }
}
