import 'dart:async';
import 'package:Gatitos/models/cat_fav_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Gatitos/models/cat_model.dart';

import '../models/breed_model.dart';

class BreedProvider {
  String _url = 'api.thecatapi.com';

  late CatBreed _catBreed;

  Future<CatBreed> getCatBreed(Cat cat) async {
    // Creamos la URL de la peticion
    final url = Uri.https(_url, '/v1/breeds/${cat.breedId}');

    // Obtenemos la resp
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final catBreed = CatBreed.fromJsonMap(decodedData);


    return catBreed;
  }
}