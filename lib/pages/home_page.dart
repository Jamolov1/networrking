import 'package:flutter/material.dart';
import 'package:networrking/pages/photos_page.dart';
import 'package:networrking/pages/product_page.dart';
import 'package:networrking/pages/todos_page.dart';
import 'package:networrking/pages/users_page.dart';
import 'package:networrking/pages/valyuta_page.dart';
import 'album_page.dart';
import 'comment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Comment();
                  }));
                },
                child: Text(
                  "Comments",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PhotosPage();
                  }));
                },
                child: Text(
                  "photos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return UsersPage();
                  }));
                },
                child: Text(
                  "users",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return AlbumPage();
                  }));
                },
                child: Text(
                  "albums",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return TodosPage();
                  }));
                },
                child: Text(
                  "todos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ValyutaPage();
                  }));
                },
                child: Text(
                  "valyuta",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ProductPage();
                  }));
                },
                child: Text(
                  "Product",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
