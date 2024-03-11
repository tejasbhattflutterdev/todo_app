import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersnalToDoInfo extends StatelessWidget {
  final String? empId;
  final int? managerId;
  final String? toDoId;
  final String? createdDate;
  final String? workTitle;
  final String? updatedDate;
  final int? deadLine;
  final String? reason;
  const PersnalToDoInfo({
    super.key,
    this.empId,
    this.managerId,
    this.toDoId,
    this.createdDate,
    this.workTitle,
    this.updatedDate,
    this.deadLine,
    this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade500,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)),
      ),
      height: 224,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text('Employee Id ==== $empId'),
            Text('Manager Id ==== $managerId'),
            Text('Todo Work Id ==== $toDoId'),
            Text('Todo Created Date ==== $createdDate'),
            Text('Todo Task Name ==== $workTitle'),
            Text('Todo updated Date ==== $updatedDate'),
            Text('Todo deadLine ==== $deadLine'),
            Text('Todo Reason === $reason'),
          ],
        ),
      ),
    );
  }
}
