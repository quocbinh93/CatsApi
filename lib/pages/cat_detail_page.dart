import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';

class CatDetail extends StatelessWidget {
  const CatDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Cat cat = ModalRoute.of(context)!.settings.arguments as Cat;

    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Center(
        child: ListView(
          children: [
            Text(
              'Cat type',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            _getBreed(cat),
            Text(
              'Character',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            _getTemperament(cat),
            Text(
              'Origin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            _getOrigin(cat),
            Text(
              'Hope for life',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            _getLifeSpan(cat),
            TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, 'breed', arguments: cat),
                child: Text('View breed information'))
          ],
        ),
      ),
    );
  }

  Widget _getBreed(Cat cat) {
    return Text(cat.breedName.toString());
  }

  Widget _getTemperament(Cat cat) {
    return Text(cat.temperament.toString());
  }

  Widget _getOrigin(Cat cat) {
    return Text(cat.origin.toString());
  }

  Widget _getLifeSpan(Cat cat) {
    return Text(cat.lifeSpan.toString());
  }
}
