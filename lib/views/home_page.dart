import 'package:flutter/material.dart';
import 'package:flutter_api/views/posts.dart';
import 'package:flutter_api/views/users.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostPage()),
              );
            },
            child: const Text(
              'POST API',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UsersPage()),
              );
            },
            child: const Text(
              'USER API',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UsersPage()),
              );
            },
            child: const Text(
              'POST API',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}
