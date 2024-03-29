import 'package:to_do_list/folder.dart';
import 'package:to_do_list/tache.dart';

class GestionTache {
  //Cette fonction retourne une liste de tâche associé à un dossier passez en paramètre
  static List<Tache> getTaskListFolder(Folder folder) {
    return [
      Tache(
          taskId: "taskId",
          title: "Achetez du pain",
          description:
              "A la boulangerie du coin à 10h avec du lait concentré pour le petit dejeuner",
          timeToDo: DateTime.now(),
          isDo: false,
          taskFolder: Folder(name: 'MY'))
    ];
  }

  //Cette fonction va inserer une Tache à travers l'api
  static void addTask(Tache task) {}

  //Cette focntion va modifier une tâche à travers l'API comme par exemple pour marquer qu'elle est terminé, ou bien changé sa decription ou son titre
  static void modifyTask(Tache task) {}

  //Cette fonction permet d'effacer une tâche
  static void deleteTask(Tache task) {}
}
