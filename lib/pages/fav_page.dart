import 'package:Gatitos/widgets/card_fav_cat_widget.dart';
import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';
import 'package:Gatitos/widgets/card_cat_widget.dart';
import 'package:Gatitos/widgets/movie_horizontal.dart';

import '../providers/cat_fav_provider.dart';

class FavPage extends StatelessWidget {
  // const HomePage({super.key});

  final catFavProvider = CatFavProvider();

  @override
  Widget build(BuildContext context) {
    catFavProvider.getFavoriteCats();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat favorites'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cat'),
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          ),
        ],
      ),
      body: _crearLista(),
    );
  }

  // Clear list
  Widget _crearLista() {
    return FutureBuilder(
      future: catFavProvider.getFavoriteCats(),
      builder: (context, AsyncSnapshot<List<Cat>> snapshot) {
        if (snapshot.hasData) {
          return CardFavCat(cats: snapshot.data!);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  // RemovetoFavorite
  void _removeFavorite(Cat cat) {
    catFavProvider.removeFavorites(cat);
  }
}
