import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Gatitos/models/cat_model.dart';
import 'package:Gatitos/providers/cat_provider.dart';
import 'package:Gatitos/widgets/card_cat_widget.dart';

import 'package:Gatitos/pages/change_password.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CatProvider catProvider = CatProvider();
  final TextEditingController searchController = TextEditingController();
  List<Cat> searchResults = [];

  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;

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
              if (value == 'logout') {
                Navigator.pushNamed(context, 'logout');
              } else if (value == 'changePassword') {
                Navigator.pushNamed(context, 'changePassword');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: <Widget>[
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text('Đăng Xuất'),
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
              _refreshCats();
            },
          ),
          if (currentUser != null)
            CircleAvatar(
              backgroundImage: NetworkImage(currentUser.photoURL ?? ''),
              radius: 17,
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Nhập từ khóa tìm kiếm...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 7),
                ElevatedButton(
                  onPressed: () {
                    _searchCats();
                  },
                  child: Text('Tìm kiếm'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _crearLista(),
          ),
        ],
      ),
    );
  }

  // Create list
  Widget _crearLista() {
    return FutureBuilder(
      future: (searchResults.isNotEmpty)
          ? Future.value(searchResults)
          : catProvider.getCats(),
      builder: (context, AsyncSnapshot<List<Cat>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return CardCat(cats: snapshot.data!);
        } else {
          return Center(
            child: Text('Không có dữ liệu'),
          );
        }
      },
    );
  }

  void _refreshCats() {
    setState(() {
      searchResults.clear();
    });
  }

  void _searchCats() {
    final String query = searchController.text.trim();
    if (query.isNotEmpty) {
      catProvider.searchCatsByName(query).then((results) {
        setState(() {
          searchResults = results;
        });
      }).catchError((error) {
        print('Error: $error');
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
