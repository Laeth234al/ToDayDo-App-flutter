class Task {
  final String id;
  final String name;
  DateTime startDate = DateTime.now();
  DateTime exDate = DateTime.now();
  bool isDone;

  Task({
    required this.id,
    required this.name,
    this.isDone = false,
    required this.startDate,
    required this.exDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate.toIso8601String(),
      'exDate': exDate.toIso8601String(),
      'isDone': isDone,
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      name: json['name'] as String,
      isDone: json['isDone'] as bool,
      startDate: DateTime.parse(json['startDate']),
      exDate: DateTime.parse(json['exDate']),
    );
  }
}
