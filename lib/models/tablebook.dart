
class BookTableModel {
    String name;
    String description;
    String uuid;
    bool isActive;

    BookTableModel({
        required this.name,
        required this.description,
        required this.uuid,
        required this.isActive,
    });

    factory BookTableModel.fromJson(Map<String, dynamic> json) => BookTableModel(
        name: json["name"],
        description: json["description"],
        uuid: json["uuid"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "uuid": uuid,
        "is_active": isActive,
    };
}
