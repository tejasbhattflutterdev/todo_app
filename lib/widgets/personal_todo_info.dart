import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersnalToDoInfo extends StatelessWidget {
  final String? empId;
  final String? toDoId;
  final String? createdDate;
  final String? workTitle;
  final String? updatedDate;
  const PersnalToDoInfo({
    super.key,
    this.empId,
    this.toDoId,
    this.createdDate,
    this.workTitle,
    this.updatedDate,
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
      height: 170,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text('Employee Id ==== $empId'),
          Text('Todo Work Id ==== $toDoId'),
          Text('Todo Created Date ==== $createdDate'),
          Text('Todo Task Name ==== $workTitle'),
          Text('Todo updated Date ==== $updatedDate'),
        ],
      ),
    );
  }
}
