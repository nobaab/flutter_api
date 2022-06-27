import '../models/post.dart';
import 'package:http/http.dart' as http;

import '../models/users.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}

class UserService {
  Future<List<User>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
  }
}
