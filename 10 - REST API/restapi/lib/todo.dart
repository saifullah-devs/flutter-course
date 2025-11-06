class Todo {
  String? title;
  String? description;
  String? category;
  int? timestamp;
  int? priority;
  // ignore: non_constant_identifier_names
  String? user_id;
  bool? isCompleted;
  String? id;

  Todo({
    this.title,
    this.description,
    this.category,
    this.timestamp,
    this.priority,
    // ignore: non_constant_identifier_names
    this.user_id,
    this.isCompleted,
    this.id,
  });

  static List<Todo> fromJsonList(List<dynamic> json) {
    List<Todo> tempTodos = [];
    for (var jsonTodo in json) {
      var jsonTodoMap = jsonTodo as Map<String, dynamic>;
      tempTodos.add(
        Todo(
          title: jsonTodoMap['title']?.toString(),
          description: jsonTodoMap['description']?.toString(),
          category: jsonTodoMap['category']?.toString(),
          timestamp: jsonTodoMap['timestamp'] != null
              ? int.tryParse(jsonTodoMap['timestamp'].toString())
              : null,
          priority: jsonTodoMap['priority'] != null
              ? int.tryParse(jsonTodoMap['priority'].toString())
              : null,
          user_id: jsonTodoMap['user_id']?.toString(),
          isCompleted: jsonTodoMap['isCompleted'] is bool
              ? jsonTodoMap['isCompleted']
              : jsonTodoMap['isCompleted'].toString().toLowerCase() == 'true',
          id: jsonTodoMap['id']?.toString(),
        ),
      );
    }
    return tempTodos;
  }
}
