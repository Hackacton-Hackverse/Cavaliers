import 'package:to_do_list/folder.dart';

class Tache {
  String taskId;
  String title;
  String? description;
  DateTime? timeToDo;
  bool isDo;
  Folder taskFolder;

  Tache(
      {required this.taskId,
      required this.title,
      required this.description,
      required this.timeToDo,
      required this.isDo,
      required this.taskFolder});
}
