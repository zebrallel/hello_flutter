class TaskSet {
  String id;
  int status;
  int type;
  List<Task> tasks;

  TaskSet.fromJson(json){
    this.id = json['id'];
    this.status = json['status'];
    this.type = json['type'];
    this.tasks = json['tasks'];
  }
}

class Task {
  String id;
  int status;
  int type;
  String contentId;
  List<Subtask> subTasks;

  Task.fromJson(json) {
    this.id = json['id'];
    this.status = json['status'];
    this.type = json['type'];
    this.contentId = json['contentId'];
    this.subTasks =
        (json['subtasks'] as List ?? []).map((_) => Subtask.fromJson(_));
  }
}

class Subtask {
  String id;
  int status;
  int type;

  Subtask.fromJson(json) {
    this.id = json['id'];
    this.status = json['status'];
    this.type = json['type'];
  }
}
