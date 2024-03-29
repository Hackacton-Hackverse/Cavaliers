import 'package:flutter/material.dart';
import 'package:to_do_list/create_task.dart';
import 'package:to_do_list/folder.dart';
import 'package:to_do_list/services/gestion_de_folder.dart';
import 'package:to_do_list/services/gestion_de_tache.dart';
import 'package:to_do_list/show_task.dart';
import 'package:to_do_list/tache.dart';

class TaskList extends StatefulWidget {
  final Folder folder;
  const TaskList({super.key, required this.folder});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool createTaskBool = false;
  bool showTaskBool = false;
  bool ignoringPointer = false;
  bool isModify = false;
  late Tache taskToAdd;
  List<Widget> taskListRows = [];

  late Tache taskToShow;

  @override
  void initState() {
    super.initState();
    getTaskListRow();
    taskToAdd = Tache(
      taskId: "",
      title: "",
      description: null,
      timeToDo: null,
      isDo: false,
      taskFolder: widget.folder,
    );

    taskToShow = Tache(
        taskId: "",
        title: "",
        description: null,
        timeToDo: null,
        isDo: false,
        taskFolder: widget.folder);
  }

  void getTaskListRow() {
    List<Tache> list = GestionTache.getTaskListFolder(widget.folder);
    taskListRows = [];
    for (Tache tach in list) {
      taskListRows.add(tacheRow(tach));
    }
  }

  //Cette fonction ramène à l'ecran principale en rendant non visible le showTask
  void cancelShowTaskBool() {
    setState(() {
      showTaskBool = false;
      ignoringPointer = false;
    });
  }

  //Cette fonction ramène à l'ecran principale en rendant non visible le createTask
  void cancelCreateTaskBool() {
    setState(() {
      createTaskBool = false;
      ignoringPointer = false;
    });
  }

  //Cette fonction ramène a l'écran principale et lance directement la fenêtre pour modification de tache
  void modifyTask(Tache task) {
    setState(() {
      showTaskBool = false;
      ignoringPointer = true;
      isModify = true;
      taskToAdd = task;
      createTaskBool = true;
    });
  }

  //Cette fonction va retourner la ligne qui permet de decrire sommairement une tâche
  Widget tacheRow(Tache task) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 241, 241, 255),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(children: [
        Transform.scale(
          scale: 2,
          child: Checkbox(
            activeColor: Colors.black,
            value: task.isDo,
            onChanged: (value) {
              setState(() {
                task.isDo = value == true ? true : false;
                GestionTache.modifyTask(task);
                task.isDo
                    ? task.taskFolder.completedTask++
                    : task.taskFolder.completedTask--;
                GestionFolder.modifyFolder(task.taskFolder);
                getTaskListRow();
              });
            },
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () => setState(() {
              taskToShow = task;
              taskToAdd = task;
              ignoringPointer = true;
              showTaskBool = true;
            }),
            child: Text(
              task.title,
              style: const TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                GestionTache.deleteTask(task);
                getTaskListRow();
              });
            },
            icon: const Icon(Icons.delete))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        title: Text(
          widget.folder.name,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 241, 241, 241),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(20),
        child: Stack(children: [
          IgnorePointer(
            ignoring: ignoringPointer,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: taskListRows,
              ),
            ),
          ),
          Center(
              child: Visibility(
                  visible: createTaskBool,
                  child: CreateTask(
                    task: taskToAdd,
                    cancelShow: cancelCreateTaskBool,
                    isModification: isModify,
                  ))),
          Center(
              child: Visibility(
                  visible: showTaskBool,
                  child: ShowTask(
                    task: taskToShow,
                    cancelShow: cancelShowTaskBool,
                    modifyTask: modifyTask,
                  ))),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => ignoringPointer
            ? null
            : setState(() {
                isModify = false;
                taskToAdd = Tache(
                    taskId: "",
                    title: "",
                    description: null,
                    timeToDo: null,
                    isDo: false,
                    taskFolder: widget.folder);
                ignoringPointer = true;
                createTaskBool = true;
              }),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
