class CatsFavorites {
  List<CatFav> items = [];

  CatsFavorites();

  CatsFavorites.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final catFav = CatFav.fromJsonMap(item);
      items.add(catFav);
    }
  }
}

class CatFav {
  int? id;
  String? imageId;
  String? subId;
  String? dateCreated;

  String? url;

  CatFav({
    this.id,
    this.imageId,
    this.subId,
    this.dateCreated,
    
    this.url,
  });

  CatFav.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['image_id'];
    subId = json['sub_id'];
    dateCreated = json['created_at'];

    url = json['image']['url'];
  }
}
