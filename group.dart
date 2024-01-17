import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

import 'group_window_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    var uuid = const Uuid();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatRoom'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Please enter your name'),
              content: Form(
                key: formKey,
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return 'User must have proper name';
                    }

                    return null;
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    nameController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String name = nameController.text;
                      nameController.clear();
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupWindowScreen(
                                name: name,
                                userId: uuid.v1(),
                              )));
                    }
                  },
                  child: const Text(
                    'Enter',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          child: const Text(
            'Initiate ChatRoom',
            style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
