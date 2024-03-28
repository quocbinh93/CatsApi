import 'dart:async';
import 'package:Gatitos/models/cat_fav_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Gatitos/models/cat_model.dart';

class CatFavProvider {
  String _url = 'api.thecatapi.com';
  String _api_key =
      'live_mcwGebtrOoyL9hbpWE8Iin8EC0QpbzCjg3clI1Dj0pSUShpELIdmu6DhubWHH6Jt';
  int _limit = 20; // * CAMBIAR LUEGO XD
  String _sub_id = 'myUser1';

  List<CatFav> _catsFav = [];

  Future<List<Cat>> getFavoriteCats() async {
    // Creamos la URL de la peticion
    final url = Uri.https(_url, '/v1/favourites',
        {'sub_id': _sub_id, 'limit': _limit.toString(), 'order': 'DESC'});

    // Obtenemos la resp
    final resp = await http.get(url, headers: {'x-api-key': _api_key});
    final decodedData = json.decode(resp.body);
    final catsFav = CatsFavorites.fromJsonList(decodedData);

    // Obtener una lista de objetos Future<List<Cat>>
    final allCatsFutures =
        catsFav.items.map((catFav) => getCatInfo(catFav)).toList();

    // Esperar a que se completen todas las llamadas a getCatInfo()
    final allCatsLists = await Future.wait(allCatsFutures);

    return allCatsLists;
  }

  Future<Cat> getCatInfo(CatFav catFav) async {
    final allInfoUrl = Uri.https(_url, '/v1/images/${catFav.imageId}');

    // Obtener resp
    final resp = await http.get(allInfoUrl);
    final decodedData = json.decode(resp.body);
    final catAllInfo = Cat.fromJsonMap(decodedData);

    return catAllInfo;
  }

  void addToFavorites(Cat cat) async {
    final addFavUrl = Uri.https(_url, '/v1/favourites');
    final data = {'image_id': cat.id, 'sub_id': _sub_id};

    print(jsonEncode(data));

    final resp = await http.post(
      addFavUrl,
      body: jsonEncode(data),
      headers: {'x-api-key': _api_key, 'Content-Type': 'application/json'},
    );

    print(resp.body);
  }
}
