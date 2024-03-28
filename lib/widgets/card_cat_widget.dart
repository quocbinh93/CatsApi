import 'package:Gatitos/providers/cat_fav_provider.dart';
import 'package:Gatitos/providers/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:Gatitos/models/cat_model.dart';

class CardCat extends StatefulWidget {
  final List<Cat> cats;

  CardCat({super.key, required this.cats});

  @override
  State<CardCat> createState() => _CardCatState();

}

class _CardCatState extends State<CardCat> {

  final _catFavProvider = CatFavProvider();
  final _scrollController = ScrollController();
  bool _isLoading = false; 
  
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 400 && !_isLoading) {
        getMoreCats();
      }
    });
    

    return ListView(
      controller: _scrollController,
      children: _crearLista(_screenSize)
    );
  }

  List<Widget> _crearLista(Size screenSize) {
    List<Widget> lista = []; 

    widget.cats.forEach((cat) { 
      lista.add(_crearCardGato(cat, screenSize));
    });

    return lista;
  }

  Widget _crearCardGato(Cat cat, Size screenSize) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(cat.breedName!),
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              height: screenSize.height * 0.4,
              child: FadeInImage(
                image: NetworkImage(cat.url!),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (() {
                  Navigator.pushNamed(context, 'detail', arguments: cat);
                }), 
                child: Text('Information')
              ),
              IconButton(
                onPressed: () {
                  /* Añadir a favoritos */
                  _catFavProvider.addToFavorites(cat);
                }, 
                icon: Icon(Icons.favorite))
            ],
          )
        ],
      ),
    );
  }

  void getMoreCats() async {
    setState(() {
      _isLoading = true;
    });

    final List<Cat> newCatList = await CatProvider().getCats();


    setState(() {
      newCatList.forEach((cat) {
        print(cat.id);
        widget.cats.add(cat);
      });
      _isLoading = false;
    });
  }
}
