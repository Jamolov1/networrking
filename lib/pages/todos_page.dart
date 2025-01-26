import 'package:flutter/material.dart';

import '../models/todos_model.dart';
import '../service/networ_service.dart';
import '../service/todos_service.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  List<TodosModel> items = [];
  var isLoading = false;

  void apiTodosList() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.getComments(Network.apiPosts, Network.paramsEmpty());
    setState(() {
      isLoading = false;
      items = TodosService.parseTodosList(response);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiTodosList();
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
                    items[index].title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    items[index].userId.toString(),
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
