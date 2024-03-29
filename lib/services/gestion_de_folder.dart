import 'package:to_do_list/folder.dart';

class GestionFolder {
  //Cette fonction permet de créer un nouveau dossier via l'API
  static void creerDossier(String nomDuDossier) {}

  //Cette Fonction retourne les différents dossiers qui existe déja
  static List<Folder> getFolderList() {
    return [Folder(name: "Hello")];
  }

  //Cette fonction permet de modifier un dossier comme par exemple le  nombre de ses tâche terminées...
  static void modifyFolder(Folder folder) {}
}
