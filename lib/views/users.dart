import 'package:flutter/material.dart';

import '../models/users.dart';
import '../services/remote_services.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User>? users;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    // fetch data from API
    fetchData();
  }

  fetchData() async {
    users = await UserService().getUsers();

    if (users != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: users?.length,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 3,
                shadowColor: Colors.blue,
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Name: ${users![index].name}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "UserName: ${users![index].username}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Email: ${users![index].email}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Phone: ${users![index].phone}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
