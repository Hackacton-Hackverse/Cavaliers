import 'package:flutter/material.dart';

class JobPageStatus extends StatefulWidget {
  const JobPageStatus({super.key});

  @override
  State<JobPageStatus> createState() => _JobPageStatusState();
}

class _JobPageStatusState extends State<JobPageStatus> {
  String username = "Mr Abel";
  late Widget bottomContainer;
  void updateBottomContainerDashboard() {
    bottomContainer = dashboardContainer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateBottomContainerDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          children: [
            ListTile(
              title: const Text(
                "Welcome back !!",
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 196, 196),
                ),
              ),
              subtitle: Text(
                username,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const IconButton(
                icon: Icon(Icons.notifications),
                onPressed: null,
              ),
            ),
            const Row(children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search), hintText: "Search"),
                ),
              ),
              IconButton(onPressed: null, icon: Icon(Icons.settings)),
            ]),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const TextButton(
                    onPressed: null,
                    autofocus: true,
                    child: Text("Dashboard"),
                  ),
                  TextButton(
                      onPressed: updateBottomContainerDashboard,
                      child: const Text("Employees")),
                  const TextButton(onPressed: null, child: Text("Jobs")),
                  const TextButton(onPressed: null, child: Text("Candidates")),
                  const TextButton(onPressed: null, child: Text("Calendar"))
                ],
              ),
            ),
            bottomContainer,
          ],
        ),
      ),
    );
  }

  Widget dashboardContainer() {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(255, 243, 222, 190)),
                          child: const Icon(
                            Icons.person_outline,
                            size: 25,
                            color: Colors.orange,
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              "Total Employee",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 196, 196),
                                  fontSize: 13),
                            ),
                            Text(
                              "95",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        )
                      ]),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(255, 243, 222, 190)),
                          child: const Icon(
                            Icons.person_outline,
                            size: 25,
                            color: Colors.orange,
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              "Job applied",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 196, 196),
                                  fontSize: 13),
                            ),
                            Text(
                              "111",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        )
                      ]),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                      BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(255, 243, 222, 190)),
                          child: const Icon(
                            Icons.person_outline,
                            size: 25,
                            color: Colors.orange,
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              "Gross Salary",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 196, 196),
                                  fontSize: 13),
                            ),
                            Text(
                              "... CFA",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
