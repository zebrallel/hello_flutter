import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';
import 'package:hello_world/pages/study_plan/models.dart';
import 'package:hello_world/pages/study_plan/study_plan_vm.dart';
import 'package:hello_world/pages/study_plan/task_set.dart';

class StudyPlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudyPlanState();
  }
}

class StudyPlanState extends State<StudyPlanPage> {
  List<TaskSet> taskSets = [];

  @override
  void initState() {
    super.initState();

    var vm = StudyPlanVM();
    taskSets = vm.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          ListView.builder(
            itemCount: taskSets.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  height: 200,
                  color: Colors.cyan,
                  child: Center(
                    child: Text('Head Area'),
                  ),
                );
              } else {
                return TaskSetWidget(
                  taskSet: taskSets[index - 1]
                );
              }
            },
          )
        ],
      ),
    );
  }
}
