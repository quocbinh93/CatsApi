import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';

/*
class MovieHorizontal extends StatelessWidget {
  final List<Cat> cats;
  final Function siguientePagina;
  MovieHorizontal({
    super.key,
    required this.peliculas,
    required this.siguientePagina,
  });

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.22,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) siguientePagina();
    });

    return Container(
      height: _screenSize.height * .25,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          return _crearTarjeta(context, peliculas[index]);
        },
        //children: _crearTarjetas(context),
      ),
    );
  }

  // Método para crear las tarjetas
  List<Widget> _crearTarjetas(BuildContext context) {
    return peliculas.map(
      (pelicula) {
        return Container(
          margin: EdgeInsets.only(right: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(pelicula.getPosterPath()),
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              SizedBox(height: 5),
              Text(
                pelicula.title!,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        );
      },
    ).toList();
  }

  // Metodo que retorna solo una tarjeta de la pelicula
  Widget _crearTarjeta(BuildContext context, Pelicula pelicula) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage(pelicula.getPosterPath()),
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
          SizedBox(height: 5),
          Text(
            pelicula.title!,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}
*/