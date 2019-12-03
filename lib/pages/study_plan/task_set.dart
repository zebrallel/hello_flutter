import 'package:flutter/material.dart';
import 'package:hello_world/pages/study_plan/models.dart';

const SubtaskTitleMap = {
  SubtaskType.WORD_LEARNING: '单词学习',
  SubtaskType.READING: '原文阅读 ',
  SubtaskType.EXPLANATION: '品读讲解',
  SubtaskType.CONSOLIDATION: '巩固专项',
  SubtaskType.WORD_REVIEW: '单词复习'
};

class TaskSetWidget extends StatelessWidget {
  final TaskSet taskSet;

  TaskSetWidget({this.taskSet});

  Widget buildTaskHead(Task task) {
    if (task.type == TaskType.REVIEW) {
      // 复习任务
      return Container();
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            task.resource.coverUrl,
            width: 32,
            height: 50,
            fit: BoxFit.fill,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    width: 42,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 202, 41, 0.2),
                        borderRadius: BorderRadius.circular(3)),
                    child: Center(
                      child: Text(
                          task.type == TaskType.INTENSIVE_READING ? '精读' : '泛读',
                          style: TextStyle(
                              color: Color.fromRGBO(230, 173, 0, 1),
                              fontSize: 11)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(task.resource.title,
                        style: TextStyle(
                            color: Color.fromRGBO(37, 34, 45, 1),
                            fontSize: 15)),
                  )
                ],
              )),
        ],
      );
    }
  }

  List<Widget> buildSubTasks(List<Subtask> subtasks) {
    return subtasks.map((subTask) {
      return Container(
          padding: EdgeInsets.fromLTRB(20, 18, 20, 18),
          margin: EdgeInsets.fromLTRB(0, 10, 40, 10),
          height: 76,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(233, 232, 234, 0.5),
                    spreadRadius: 5,
                    blurRadius: 8)
              ]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(SubtaskTitleMap[subTask.type],
                    style: TextStyle(
                        color: Color.fromRGBO(37, 34, 45, 1), fontSize: 15)),
              ),
              Container(
                height: 28,
                width: 72,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(255, 202, 41, 1)),
                child: Center(
                  child: Text(
                    '开始学习',
                    style: TextStyle(
                        color: Color.fromRGBO(37, 34, 45, 1), fontSize: 12),
                  ),
                ),
              )
            ],
          ));
    }).toList();
  }

  List<Widget> buildTask() {
    return this.taskSet.tasks.map((Task task) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildTaskHead(task)]
            ..addAll(buildSubTasks(task.subTasks)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double taskSetHeight = getTaskSetHeight();

    return Container(
        margin: EdgeInsets.only(bottom: 20),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomPaint(
              key: GlobalKey(),
              size: Size(57, taskSetHeight),
              painter: TimeLine(),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(children: buildTask()),
            ))
          ],
        ));
  }

  double getTaskSetHeight() {
    const subTaskHeight = 96;
    const taskHeadHeight = 104;

    int taskSetHeight = this.taskSet.tasks.fold(0, (prev, Task nextTask) {
      return prev +
          taskHeadHeight +
          nextTask.subTasks.fold(0, (_prev, Subtask nextSubTask) {
            return _prev + subTaskHeight;
          });
    });

    return taskSetHeight + .0;
  }
}

class TimeLine extends CustomPainter {
  double gapLen = 150;
  double headRadius = 5;
  double subTaskRadius = 3;

  void drawDashedLine(
      Canvas canvas, Paint pen, double x, double startY, double endY) {
    const density = 2;
    double len = endY - startY;

    for (double i = 0; i * 2 * density < len; i++) {
      canvas.drawLine(Offset(x, startY + i * 2 * density),
          Offset(x, startY + i * 2 * density + density), pen);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    double half = size.width / 2;
    double lineEnd = 100;

    Paint pen = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xffffca29)
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(half, lineEnd), headRadius, pen);
    drawDashedLine(canvas, pen, half, lineEnd, lineEnd + gapLen);
    canvas.drawCircle(Offset(half, lineEnd + gapLen), headRadius, pen);
    drawDashedLine(canvas, pen, half, lineEnd, lineEnd + gapLen * 2);
    canvas.drawCircle(Offset(half, lineEnd + gapLen * 2), headRadius, pen);
    drawDashedLine(canvas, pen, half, lineEnd, lineEnd + gapLen * 3);
    canvas.drawCircle(Offset(half, lineEnd + gapLen * 3), headRadius, pen);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
