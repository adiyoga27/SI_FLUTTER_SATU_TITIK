class ReservasiModel {
    ReservasiModel({
        required this.status,
        required this.message,
        required this.data,
    });

    final bool? status;
    final String? message;
    final ReservasiData? data;

    factory ReservasiModel.fromJson(Map<String, dynamic> json){ 
        return ReservasiModel(
            status: json["status"],
            message: json["message"],
            data: json["data"] == null ? null : ReservasiData.fromJson(json["data"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };

}

class ReservasiData {
    ReservasiData({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.tableId,
        required this.orderNumber,
        required this.customerName,
        required this.customerHp,
        required this.totalPrice,
        required this.discount,
        required this.tax,
        required this.totalPayment,
        required this.status,
        required this.paymentMethod,
        required this.paymentNumber,
        required this.note,
        required this.uuid,
    });

    final int? id;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic userId;
    final String? tableId;
    final String? orderNumber;
    final String? customerName;
    final String? customerHp;
    final String? totalPrice;
    final String? discount;
    final String? tax;
    final String? totalPayment;
    final String? status;
    final String? paymentMethod;
    final dynamic paymentNumber;
    final dynamic note;
    final String? uuid;

    factory ReservasiData.fromJson(Map<String, dynamic> json){ 
        return ReservasiData(
            id: json["id"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
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
            paymentMethod: json["payment_method"],
            paymentNumber: json["payment_number"],
            note: json["note"],
            uuid: json["uuid"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
        "payment_method": paymentMethod,
        "payment_number": paymentNumber,
        "note": note,
        "uuid": uuid,
    };

}
