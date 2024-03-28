import 'package:Gatitos/providers/breed_provider.dart';
import 'package:Gatitos/widgets/card_breed_widget.dart';
import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';
import 'package:Gatitos/widgets/card_cat_widget.dart';
import 'package:Gatitos/widgets/movie_horizontal.dart';

import '../models/breed_model.dart';
import '../providers/cat_fav_provider.dart';

class BreedInfo extends StatelessWidget {
  final BreedProvider breedProvider = BreedProvider();

  @override
  Widget build(BuildContext context) {
    final Cat cat = ModalRoute.of(context)!.settings.arguments as Cat;

    return Scaffold(
      appBar: AppBar(
        title: Text('Breed Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildInfoSection(cat),
      ),
    );
  }

  Widget _buildInfoSection(Cat cat) {
    return FutureBuilder(
      future: breedProvider.getCatBreed(cat),
      builder: (context, AsyncSnapshot<CatBreed> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return CardBreed(catBreed: snapshot.data!, cat: cat);
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }
}
