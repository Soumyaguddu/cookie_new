import 'dart:convert';
class CatalogModel {
  static List<Item> items= List.empty();
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  final bool added;
  final bool isFavorite;
  Item({
   required this.id,
   required this.name,
   required this.desc,
   required this.price,
   required this.color,
   required this.image,
   required this.added,
   required this.isFavorite,
  });

 

  Item copyWith({
    required int id,
   required String name,
   required String desc,
    required num price,
    required String color,
    required String image,
    required bool added,
    required bool isFavorite,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
      added: added ?? this.added,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Item merge(Item model) {
    return Item(
      id: model.id ?? this.id,
      name: model.name ?? this.name,
      desc: model.desc ?? this.desc,
      price: model.price ?? this.price,
      color: model.color ?? this.color,
      image: model.image ?? this.image,
      added: model.added ?? this.added,
      isFavorite: model.isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
      'added': added,
      'isFavorite': isFavorite,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
  

    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
      added: map['added'],
      isFavorite: map['isFavorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Item &&
      o.id == id &&
      o.name == name &&
      o.desc == desc &&
      o.price == price &&
      o.color == color &&
      o.image == image &&
      o.added == added &&
      o.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      image.hashCode ^
    added.hashCode ^
    isFavorite.hashCode;
  }
}
