// class CatBreeds {
//   List<CatBreed> items = [];

//   CatBreeds();

//   CatBreeds.fromJsonList(List<dynamic> jsonList) {
//     if (jsonList == null) return;

//     for (var item in jsonList) {
//       final catFav = CatBreed.fromJsonMap(item);
//       items.add(catFav);
//     }
//   }
// }

class CatBreed {
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? lifeSpan;
  String? description;

  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? hypoallergenic;
  int? hairless;

  CatBreed({
    this.id,
    this.name,
    this.temperament,
    this.origin,
    this.lifeSpan,
    this.description,

    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.hypoallergenic,
    this.hairless
  });

  CatBreed.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    temperament = json['temperament'];
    origin = json['origin'];
    lifeSpan = json['life_span'];
    description = json['description'];

    affectionLevel = json['affection_level'];
    childFriendly = json['child_friendly'];
    dogFriendly = json['dog_friendly'];
    energyLevel = json['energy_level'];
    hypoallergenic = json['hypoallergenic'];
    hairless = json['hairless'];
  }
}
