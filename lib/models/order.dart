class OrderModel {
  String diningTable;
  String user;
  String orderNumber;
  String customerName;
  String customerHp;
  int totalPrice;
  int discount;
  int tax;
  int totalPayment;
  String status;
  String paymentMethod;
  dynamic paymentNumber;
  dynamic note;
  String uuid;
  int isAlreadyOrder;
  List<Cart> cart;

  OrderModel(
      {required this.diningTable,
      required this.user,
      required this.orderNumber,
      required this.customerName,
      required this.customerHp,
      required this.totalPrice,
      required this.discount,
      required this.tax,
      required this.totalPayment,
      required this.status,
      required this.paymentMethod,
      this.paymentNumber,
      this.note,
      required this.uuid,
      required this.cart,
      required this.isAlreadyOrder});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        diningTable: json["dining_table"],
        user: json["user"],
        orderNumber: json["order_number"],
        customerName: json["customer_name"],
        customerHp: json["customer_hp"],
        totalPrice: json["total_price"],
        discount: json["discount"],
        tax: json["tax"],
        totalPayment: json["total_payment"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        paymentNumber: json["payment_number"],
        note: json["note"],
        uuid: json["uuid"],
        isAlreadyOrder: json["isAlreadyOrder"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dining_table": diningTable,
        "user": user,
        "order_number": orderNumber,
        "customer_name": customerName,
        "customer_hp": customerHp,
        "total_price": totalPrice,
        "discount": discount,
        "tax": tax,
        "total_payment": totalPayment,
        "status": status,
        "payment_method": paymentMethod,
        "payment_number": paymentNumber,
        "note": note,
        "uuid": uuid,
        "isAlreadyOrder": isAlreadyOrder,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
      };
}

class Cart {
  int id;
  int productId;
  String name;
  int price;
  int quantity;
  int discount;
  int totalPrice;
  String status;

  Cart({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.totalPrice,
    required this.status,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": name,
        "price": price,
        "quantity": quantity,
        "discount": discount,
        "total_price": totalPrice,
        "status": status,
      };
}
