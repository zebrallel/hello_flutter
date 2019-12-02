import 'package:hello_world/pages/study_plan/mock.dart';
import 'package:hello_world/pages/study_plan/models.dart';

class StudyPlanService {
  static List<TaskSet> getTaskSets(){
    return mockTaskSets.map((_) => TaskSet.fromJson(_));
  }
}