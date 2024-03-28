import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';
import 'package:Gatitos/providers/cat_provider.dart';
import 'package:Gatitos/widgets/card_cat_widget.dart';
import 'package:Gatitos/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final CatProvider catProvider = CatProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, 'fav');
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'login') {
                // Handle login action
                Navigator.pushNamed(context, 'login');
              } else if (value == 'changePassword') {
                // Handle change password action
                Navigator.pushNamed(context, 'changePassword');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'login',
                child: Row(
                  children: <Widget>[
                    Icon(Icons.login),
                    SizedBox(width: 10),
                    Text('Đăng nhập'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'changePassword',
                child: Row(
                  children: <Widget>[
                    Icon(Icons.lock),
                    SizedBox(width: 10),
                    Text('Đổi mật khẩu'),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Refresh cats
              catProvider.getCats();
            },
          ),
        ],
      ),
      body: _crearLista(),
    );
  }

  // Create list
  Widget _crearLista() {
    return FutureBuilder(
      future: catProvider.getCats(),
      builder: (context, AsyncSnapshot<List<Cat>> snapshot) {
        if (snapshot.hasData) {
          return CardCat(cats: snapshot.data!);
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
}
