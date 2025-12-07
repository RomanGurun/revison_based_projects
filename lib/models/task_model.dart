class Task {
  final String ids;
  final String title;
  final String description;
  final String status;

  Task({
    required this.ids,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      ids: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 'P',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': ids,
      'title': title,
      'description': description,
      'status': status,
    };
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
  }) {
    return Task(
      ids: id ?? this.ids,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}