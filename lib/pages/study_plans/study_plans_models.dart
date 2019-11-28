class StudyPlans {
  List<Task> tasks;

  StudyPlans.fromJson(json){
    this.tasks = (json as List ?? []).map((_) => Task.fromJson(_));
  }
}

class Task {
  String title;
  String cover;
  List<SubTask> subTasks;

  Task.fromJson(json){
    this.title = json['title'] ?? '';
    this.cover = json['cover'] ?? '';
    this.subTasks = (json['subTasks'] as List ?? []).map((_) => SubTask.fromJson(_));
  }
}

class SubTask {
  String title;
  String desc;
  bool finished;

  SubTask.fromJson(json){
    this.title = json['title'] ?? '';
    this.desc = json['desc'] ?? '';
    this.finished = json['finished'] ?? false;
  }
}