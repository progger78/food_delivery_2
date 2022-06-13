class CartModel {
  int? id;
  String? name;

  int? price;
  String? img;
  int? quantity;
  String? time;
  bool? isExist;

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.isExist,
    required this.quantity,
    required this.time,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    price = json['price'];
    isExist = json['isExist'];
    quantity = json['quantity'];
    time = json['time'];
    img = json['img'];
  }
}
