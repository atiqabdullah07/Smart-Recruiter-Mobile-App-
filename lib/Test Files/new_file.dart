import 'package:flutter/material.dart';

class BlocPractice extends StatelessWidget {
  const BlocPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Practice"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(users[index].name),
                    Text(users[index].age),
                    Text(users[index].role),
                    Text(users[index].gender),
                  ],
                ),
                tileColor: Colors.teal.withOpacity(0.5),
              ),
            );
          }),
    );
  }
}

//////////////////////////

class User {
  final String name;
  final String age;
  final String role;
  final String gender;

  User(
      {required this.name,
      required this.age,
      this.role = 'Engineer',
      required this.gender});
}

List users = [
  User(
    name: 'Atiq',
    age: '22',
    gender: 'Male',
  ),
  User(
    name: 'Atiq',
    age: '22',
    gender: 'Male',
  ),
];
