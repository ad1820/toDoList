import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'home_page.dart';
class ToDoTile extends StatelessWidget {
  late final String taskName;
  late final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletFunction;

  ToDoTile({

    required this.taskName,
    required this.taskcompleted,
    required this.onChanged,
    required this.deletFunction,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),

          ),
          child: Row(
              children: [
                //checkbox
                Checkbox(
                    value: taskcompleted,
                    onChanged: onChanged,
                    activeColor: Colors.red,
                ),
                //task name
                Text(
                    taskName,
                    style: TextStyle(
                      decoration: taskcompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                ),
              ],
          ),

        ),
      ),
    );
  }
}