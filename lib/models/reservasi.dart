class ReservasiModel {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userId;
  String tableId;
  String orderNumber;
  String customerName;
  String customerHp;
  String totalPrice;
  String discount;
  String tax;
  String totalPayment;
  String status;
  dynamic paidAt;
  String paymentMethod;
  dynamic paymentNumber;
  dynamic note;
  String uuid;
  String pay;

  ReservasiModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.userId,
    required this.tableId,
    required this.orderNumber,
    required this.customerName,
    required this.customerHp,
    required this.totalPrice,
    required this.discount,
    required this.tax,
    required this.totalPayment,
    required this.status,
    this.paidAt,
    required this.paymentMethod,
    this.paymentNumber,
    this.note,
    required this.uuid,
    required this.pay,
  });

  factory ReservasiModel.fromJson(Map<String, dynamic> json) => ReservasiModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        tableId: json["table_id"],
        orderNumber: json["order_number"],
        customerName: json["customer_name"],
        customerHp: json["customer_hp"],
        totalPrice: json["total_price"],
        discount: json["discount"],
        tax: json["tax"],
        totalPayment: json["total_payment"],
        status: json["status"],
        paidAt: json["paid_at"],
        paymentMethod: json["payment_method"],
        paymentNumber: json["payment_number"],
        note: json["note"],
        uuid: json["uuid"],
        pay: json["pay"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "table_id": tableId,
        "order_number": orderNumber,
        "customer_name": customerName,
        "customer_hp": customerHp,
        "total_price": totalPrice,
        "discount": discount,
        "tax": tax,
        "total_payment": totalPayment,
        "status": status,
        "paid_at": paidAt,
        "payment_method": paymentMethod,
        "payment_number": paymentNumber,
        "note": note,
        "uuid": uuid,
        "pay": pay,
      };
}
