import 'package:flutter/material.dart';
import 'package:to_do_list/folder.dart';
import 'package:to_do_list/services/gestion_de_folder.dart';
import 'package:to_do_list/show_task_in_folder.dart';

class ShowFolder extends StatefulWidget {
  const ShowFolder({super.key});

  @override
  State<ShowFolder> createState() => _ShowFolderState();
}

class _ShowFolderState extends State<ShowFolder> {
  List<FolderIcon> listOfFolders = [];
  String newFolderName = "";
  bool createFolderBool = false;
  bool ignorePointer = false;

  @override
  void initState() {
    super.initState();
    getListOfFoldersIcon();
  }

  void getListOfFoldersIcon() {
    List<Folder> list = GestionFolder.getFolderList();
    listOfFolders = [];
    for (Folder fold in list) {
      listOfFolders.add(FolderIcon(folder: fold));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        title: const Text(
          "Folders",
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: const Color.fromARGB(255, 241, 241, 241),
        child: Stack(children: [
          IgnorePointer(
            ignoring: ignorePointer,
            child: SingleChildScrollView(
              child: Container(
                child: Column(children: listOfFolders),
              ),
            ),
          ),
          Visibility(
              visible: createFolderBool,
              child: Stack(
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.white),
                        child: Column(children: [
                          const Text(
                            "Créer un nouveau dossier",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            onChanged: (value) => newFolderName,
                            decoration: InputDecoration(
                                hintText: "Nom du dossier",
                                fillColor: Colors.grey.withOpacity(0.5)),
                            keyboardType: TextInputType.text,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                      onPressed: () => setState(() {
                                            ignorePointer = false;
                                            createFolderBool = false;
                                          }),
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(fontSize: 20),
                                      ))),
                              Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        if (newFolderName.isNotEmpty) {
                                          GestionFolder.creerDossier(
                                              newFolderName);
                                        }
                                        setState(() {
                                          getListOfFoldersIcon();
                                          ignorePointer = false;
                                          createFolderBool = false;
                                        });
                                      },
                                      child: const Text(
                                        "Create",
                                        style: TextStyle(fontSize: 20),
                                      ))),
                            ],
                          )
                        ]),
                      )
                    ],
                  )
                ],
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ignorePointer
            ? null
            : () => setState(() {
                  ignorePointer = true;
                  createFolderBool = true;
                }),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FolderIcon extends StatelessWidget {
  final Folder folder;
  const FolderIcon({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => TaskList(folder: folder))),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            folder.name,
            style: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const Padding(padding: EdgeInsets.all(2)),
          Text(
            "${folder.nbreDeTache} tâches - ${folder.completedTask} terminé",
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          const Padding(padding: EdgeInsets.all(4)),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(20),
            value: folder.nbreDeTache == 0
                ? 0.001
                : (folder.completedTask / folder.nbreDeTache),
            backgroundColor: Colors.white,
            color: Colors.blue,
            minHeight: 10,
          )
        ]),
      ),
    );
  }
}
