import 'package:flutter/material.dart';

class LoginPageAdmin extends StatelessWidget {
  LoginPageAdmin({super.key});

  final formKey = GlobalKey<FormState>();

  void validation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    String inputOne;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
          child: Column(
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 211, 196, 196)),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 231, 208, 208),
                ),
                keyboardType: TextInputType.text,
                onSaved: (newValue) => inputOne = newValue as String,
              ),
              const Padding(padding: EdgeInsets.all(15)),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 231, 208, 208),
                ),
                keyboardType: TextInputType.text,
                onSaved: (newValue) => inputOne = newValue as String,
              ),
              const Padding(padding: EdgeInsets.all(15)),
              const Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                      onPressed: null,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(30),
              ),
              const TextButton(
                onPressed: null,
                child: Text(
                  "Don't have an account ?",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 211, 196, 196)),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          side: MaterialStatePropertyAll(
                              BorderSide(color: Colors.blue, width: 2))),
                      onPressed: null,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
