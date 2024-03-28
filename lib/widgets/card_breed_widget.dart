import 'package:Gatitos/models/breed_model.dart';
import 'package:Gatitos/providers/breed_provider.dart';
import 'package:Gatitos/providers/cat_fav_provider.dart';
import 'package:Gatitos/providers/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:Gatitos/models/cat_model.dart';

class CardBreed extends StatefulWidget {
  final CatBreed catBreed;
  final Cat cat;

  CardBreed({super.key, required this.catBreed, required this.cat});

  @override
  State<CardBreed> createState() => _CardBreedState();
}

class _CardBreedState extends State<CardBreed> {
  final _breedProvider = BreedProvider();

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    //int _limit = widget.cats.length - 10;

    return Card(
        child: ListView(
      children: _crearInfoRaza(widget.catBreed),
    ));
  }

  List<Widget> _crearInfoRaza(CatBreed catBreed) {
    List<Widget> listaInfo = [];

    final image = FadeInImage(
      image: NetworkImage(widget.cat.url!),
      placeholder: AssetImage('assets/images/no-image.jpg'),
      fit: BoxFit.cover,
    );
    final name = Text(catBreed.name!);
    final description = Text(catBreed.description!);
    final origin = Text(catBreed.origin!);
    final temperament = Text('Temperamento: ${catBreed.temperament!}');
    final lifeSpan = Text('Esperanza de vida: ${catBreed.lifeSpan!}');

    // final levels = Column(
    //   children: [
    //     _createLevel('Nivel de afecto', catBreed.affectionLevel!),
    //     _createLevel('Amigable con los niños', catBreed.childFriendly!),
    //     _createLevel('Amigable con los perros', catBreed.dogFriendly!),
    //     _createLevel('Nivel de energía', catBreed.energyLevel!),
    //   ],
    // );

    final tags = Row(
      children: [
        catBreed.hypoallergenic == 1
            ? _createTag('hypoallergenic')
            : Container(),
        catBreed.hairless == 1 ? _createTag('hairless') : Container()
      ],
    );

    listaInfo.add(image);
    listaInfo.add(name);
    listaInfo.add(description);
    listaInfo.add(origin);
    listaInfo.add(temperament);
    listaInfo.add(lifeSpan);
    // listaInfo.add(levels);
    listaInfo.add(tags);

    return listaInfo;
  }

  // Widget _createLevel(String title, int level) {

  //   final List<Widget> levelList = [];

  //   for (int i=0; i<level; i++) {
  //     levelList.add(Icon(Icons.star, color: Colors.amber));
  //   }

  //   return Column(
  //     children: [
  //       Text(title),
  //       Row(children: levelList, mainAxisAlignment: MainAxisAlignment.center),
  //       SizedBox(height: 15.0)
  //     ]
  //   );
  // }

  Widget _createTag(String tag) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.blue,
          child: Text(tag),
        ),
      ),
    );
  }
}
