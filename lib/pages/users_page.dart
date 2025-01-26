import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../service/album_service.dart';
import '../service/user_service.dart';


class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UserModel> items = [];
  var isLoading = false;

  void apiUserList() async {
    setState(() {
      isLoading = true;
    });
    var response = await UserService.GET(
        AlbumService.apiAlbum, AlbumService.albumParamsEmpty());
    setState(() {
      isLoading = false;
      items = UserService.parseUsersList(response);
      print(items);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[index].name),
                    Text(items[index].phone),
                    Text(items[index].username),
                    Text(items[index].website),
                    Text(items[index].address.city),
                    Text(items[index].company.name),
                  ],
                )
              );
            },
            itemCount: items.length,
          ),
          isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : SizedBox(),
        ],
      ),
    );
  }
}
