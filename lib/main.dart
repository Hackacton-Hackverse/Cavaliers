import 'package:flutter/material.dart';
import 'package:to_do_list/create_task.dart';
import 'package:to_do_list/show_task.dart';
import 'package:to_do_list/tache.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 195, 161)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool createTaskBool = false;
  bool showTaskBool = false;
  bool ignoringPointer = false;
  Tache taskToAdd = Tache(
      taskId: "", title: "", description: null, timeToDo: null, isDo: false);
  late Tache taskToShow = Tache(
      taskId: "", title: "", description: null, timeToDo: null, isDo: false);

  Tache tache = Tache(
      taskId: "taskId",
      title: "Achetez du pain",
      description:
          "A la boulangerie du coin à 10h avec du lait concentré pour le petit dejeuner",
      timeToDo: DateTime.now(),
      isDo: false);

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
            shape: const CircleBorder(),
            onChanged: (value) {
              setState(() {
                task.isDo = value == true ? true : false;
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
        const IconButton(onPressed: null, icon: Icon(Icons.delete))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mes tâches",
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(20),
        child: Stack(children: [
          IgnorePointer(
            ignoring: ignoringPointer,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  tacheRow(tache),
                ],
              ),
            ),
          ),
          Center(
              child: Visibility(
                  visible: createTaskBool,
                  child: CreateTask(
                    task: taskToAdd,
                    cancelShow: cancelCreateTaskBool,
                  ))),
          Center(
              child: Visibility(
                  visible: showTaskBool,
                  child: ShowTask(
                    task: taskToShow,
                    cancelShow: cancelShowTaskBool,
                  ))),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 195, 161),
        onPressed: () => ignoringPointer
            ? null
            : setState(() {
                taskToAdd = Tache(
                    taskId: "",
                    title: "",
                    description: null,
                    timeToDo: null,
                    isDo: false);
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
