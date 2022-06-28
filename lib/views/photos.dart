import 'package:flutter/material.dart';

import '../models/images.dart';
import '../services/remote_services.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List<Images>? images;
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    fetchData();
  }

  fetchData() async {
    images = await ImageService().getImages();
    if (images != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: images?.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                shadowColor: Colors.blue,
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.network(
                        images![index].url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
