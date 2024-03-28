import 'package:flutter/material.dart';
import 'package:to_do_list/tache.dart';

// ignore: must_be_immutable
class CreateTask extends StatefulWidget {
  Tache task;
  final bool isModification;
  final VoidCallback cancelShow;
  CreateTask(
      {super.key,
      required this.task,
      this.isModification = false,
      required this.cancelShow});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  late Tache task;

  @override
  void initState() {
    super.initState();

    task = widget.task;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: IntrinsicHeight(
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
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Créer une tâche",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(25)),
                TextFormField(
                  initialValue: task.title,
                  decoration: const InputDecoration(
                    labelText: "Titre",
                    hintText: "Entrer le titre de la tâche",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18),
                  validator: (value) => value!.isEmpty
                      ? "Veuillez entrer un titre à votre tâche"
                      : null,
                  keyboardType: TextInputType.text,
                  onSaved: (newValue) => task.title = newValue as String,
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  initialValue: task.description,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: "Entrer une description de la tâche",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18),
                  validator: (value) => null,
                  keyboardType: TextInputType.text,
                  onSaved: (newValue) => task.description = newValue as String,
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    TextButton(
                      onPressed: selectTimeToDo,
                      child: task.timeToDo == null
                          ? const Text("Ajouter une date")
                          : Text(
                              "${task.timeToDo!.day} / ${task.timeToDo!.month} / ${task.timeToDo!.year}",
                              style: const TextStyle(fontSize: 18),
                            ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: null,
                        child: Text(
                          widget.isModification ? "Modifier" : "Ajouter",
                          style: const TextStyle(fontSize: 18),
                        )),
                    TextButton(
                        onPressed: widget.cancelShow,
                        child: Text(
                          "Annuler",
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectTimeToDo() async {
    DateTime? picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2030));

    if (picker != null) {
      setState(() {
        task.timeToDo = picker;
      });
    }
  }
}
