class Tache {
  String taskId;
  String title;
  String? description;
  DateTime? timeToDo;
  bool isDo;

  Tache(
      {required this.taskId,
      required this.title,
      required this.description,
      required this.timeToDo,
      required this.isDo});
}
