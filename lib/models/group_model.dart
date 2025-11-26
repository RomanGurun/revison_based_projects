class Group {
  final String id;
  final String name;
  final String category;
  final bool isJoined;

  Group({required this.id, required this.name, required this.category, this.isJoined = false});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'].toString(),
      name: json['name'] ?? 'Unnamed Group',
      category: json['category'] ?? 'Free',
      isJoined: json['is_joined'] ?? false,
    );
  }
}
