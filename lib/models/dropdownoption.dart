class DropdownOption {
  final String id;
  final String name;
  final String uuid;

  DropdownOption({required this.id, required this.uuid, required this.name});

  factory DropdownOption.fromJson(Map<String, dynamic> json) {
    return DropdownOption(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
    );
  }
}
