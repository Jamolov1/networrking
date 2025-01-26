import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../service/networ_service.dart';

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<Post> items = [];
  var isLoading = false;

  void apiPostList() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.getComments(Network.apiPosts, Network.paramsEmpty());
    setState(() {
      isLoading = false;
      items = Network.parsePostList(response);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    items[index].email,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    items[index].body,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  leading: Text(
                    items[index].id.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
            itemCount: items.length,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
