import 'package:flutter/material.dart';

import '../models/valyuta_model.dart';
import '../service/valyuta_service.dart';

class ValyutaPage extends StatefulWidget {
  const ValyutaPage({super.key});

  @override
  State<ValyutaPage> createState() => _ValyutaPageState();
}

class _ValyutaPageState extends State<ValyutaPage> {
  List<ValyutaModel> items = [];
  var isLoading = false;

  void apiUserList() async {
    setState(() {
      isLoading = true;
    });
    var response = await ValyutaService.GET();
    setState(() {
      isLoading = false;
      items = ValyutaService.parseUsersList(response);
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
      appBar: AppBar(
        title: Text(
          "Valyutalar Kursi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    items[index].ccyNmUz,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    items[index].ccy,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${items[index].rate} so'm",
                        style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                      Text(items[index].diff,style: TextStyle(color: Colors.brown,fontSize: 16),)
                    ],
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
