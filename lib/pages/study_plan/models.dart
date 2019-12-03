enum StatusType {
  UNKNOWN,
  // 未完成
  PEDNING,
  // 已完成
  FINISHED
}

enum TaskSetType {
  UNKNOWN,
  // 学习任务
  STUDY_TASK,
  // 复习任务
  REVIEW_TASK,
}

enum TaskType {
  UNKNOWN,
  // 精读
  INTENSIVE_READING,
  // 泛读
  EXTENSIVE_READING,
  // 复习
  REVIEW
}

enum SubtaskType {
  UNKNOWN,
  // 单词学习
  WORD_LEARNING,
  // 原文阅读
  READING,
  // 品读讲解
  EXPLANATION,
  // 巩固专项
  CONSOLIDATION,
  // 单词复习
  WORD_REVIEW,
}

class TaskSet {
  String id;
  StatusType status;
  TaskSetType type;
  List<Task> tasks;

  TaskSet.fromJson(json) {
    this.id = json['id'];
    this.status = StatusType.values[json['status'] ?? 0];
    this.type = TaskSetType.values[json['type'] ?? 0];
    this.tasks =
        (json['tasks'] as List ?? []).map((_) => Task.fromJson(_)).toList();
  }
}

class Task {
  String id;
  StatusType status;
  TaskType type;
  String contentId;
  List<Subtask> subTasks;
  Resource resource;

  Task.fromJson(json) {
    this.id = json['id'];
    this.status = StatusType.values[json['status'] ?? 0];
    this.type = TaskType.values[json['type'] ?? 0];
    this.contentId = json['contentId'];
    this.subTasks = (json['subTasks'] as List ?? [])
        .map((_) => Subtask.fromJson(_))
        .toList();
  }

  void setResource(Resource resource) {
    this.resource = resource;
  }
}

class Subtask {
  String id;
  StatusType status;
  SubtaskType type;

  Subtask.fromJson(json) {
    this.id = json['id'];
    this.status = StatusType.values[json['status'] ?? 0];
    this.type = SubtaskType.values[json['type'] ?? 0];
  }
}

class Resource {
  String coverUrl;
  String title;

  Resource.fromJson(json) {
    this.coverUrl = json['coverUrl'];
    this.title = json['title'];
  }
}
