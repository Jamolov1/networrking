import 'package:flutter/material.dart';

import '../models/album_model.dart';
import '../service/album_service.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List<Album> items = [];
  var isLoading = false;

  void apiAlbumList() async {
    setState(() {
      isLoading = true;
    });
    var response = await AlbumService.GET(
        AlbumService.apiAlbum, AlbumService.albumParamsEmpty());
    setState(() {
      isLoading = false;
      items = AlbumService.parseAlbumList(response);
      print(items);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiAlbumList();
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
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  leading: Text(
                    items[index].id.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    items[index].userId.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
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
