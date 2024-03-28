class Cats {
  List<Cat> items = [];

  Cats();

  Cats.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final cat = Cat.fromJsonMap(item);
      items.add(cat);
    }
  }
}

class Cat {
  String? id;
  String? url;
  int? width;
  int? height;

  String? breedId;
  String? breedName;
  String? temperament;
  String? origin;
  String? lifeSpan;
  String? wikipediaUrl;


  Cat({
    this.id,
    this.url,
    this.width,
    this.height,
    
    this.breedId,
    this.breedName,
    this.temperament,
    this.origin,
    this.lifeSpan,
    this.wikipediaUrl
  });

  Cat.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];

    breedId = json['breeds'][0]['id'];
    breedName = json['breeds'][0]['name'];
    temperament = json['breeds'][0]['temperament'];
    origin = json['breeds'][0]['origin'];
    lifeSpan = json['breeds'][0]['life_span'];
    wikipediaUrl = json['breeds'][0]['wikipedia_url'];
  }

  // Método para obtener la imagen del gato
  getCatImage() {
    if (url == null) {
      return 'https://freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png';
    } else {
      return url;
    }
  }
}
