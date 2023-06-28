class DiningTableModel {
  int id;
  String uuid;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  DiningTableModel({
    required this.id,
    required this.uuid,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory DiningTableModel.fromJson(Map<String, dynamic> json) =>
      DiningTableModel(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
