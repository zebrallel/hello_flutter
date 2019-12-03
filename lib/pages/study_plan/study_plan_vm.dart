import 'package:flutter/material.dart';
import 'package:hello_world/pages/study_plan/models.dart';
import 'package:hello_world/pages/study_plan/service.dart';

class StudyPlanVM extends ChangeNotifier {
  List<TaskSet> taskSets = [];

  List<TaskSet> initData() {
    taskSets = StudyPlanService.getTaskSets();

    taskSets.forEach((TaskSet taskSet) => {
          taskSet.tasks = taskSet.tasks.map((Task task) {
            Resource resource = StudyPlanService.getResource(task.contentId);

            return task..setResource(resource);
          }).toList()
        });

    // _notify();
    return taskSets;
  }

  _notify() {
    try {
      notifyListeners();
    } catch (e) {
      // TODO: log.i
    }
  }
}
