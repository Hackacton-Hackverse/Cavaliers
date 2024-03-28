import 'package:flutter/material.dart';
import 'package:to_do_list/tache.dart';

class ShowTask extends StatelessWidget {
  final Tache task;
  final VoidCallback cancelShow;
  const ShowTask({super.key, required this.task, required this.cancelShow});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 8, right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 241, 255),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 10)),
            ]),
        child: IntrinsicHeight(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Tâche",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            const Text(
              "Titre :",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              task.title,
              style: const TextStyle(fontSize: 18),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Text(
              "Description :",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              task.description!.isEmpty
                  ? "Pas de description"
                  : task.description as String,
              style: const TextStyle(fontSize: 18),
            ),
            const Text(
              "Date",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "${task.timeToDo!.day} / ${task.timeToDo!.month} / ${task.timeToDo!.year}",
              style: const TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const TextButton(
                    onPressed: null,
                    child: Text(
                      "Modifier",
                      style: TextStyle(fontSize: 18),
                    )),
                TextButton(
                    onPressed: cancelShow,
                    child: const Text(
                      "OK",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
