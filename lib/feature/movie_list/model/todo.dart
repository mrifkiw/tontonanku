class Todos {
  List<Todo>? todos;

  Todos({required this.todos});

  factory Todos.fromJson(List<dynamic> json) {
    
      final List<Todo> todos = <Todo>[];
      for (var v in json) {
        todos.add(Todo.fromJson(v));
      }
      return Todos(todos: todos);
  }
  
}

class Todo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Todo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Todo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
