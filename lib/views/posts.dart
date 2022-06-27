import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/remote_services.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post>? posts;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    // fetch data from API
    fetchData();
  }

  fetchData() async {
    posts = await RemoteService().getPosts();

    if (posts != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('API'),
        ),
        body: Visibility(
          visible: isLoading,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts![index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              posts![index].body ?? " ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
