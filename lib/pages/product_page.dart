import 'package:flutter/material.dart';
import 'package:networrking/models/product_model.dart';
import 'package:networrking/service/product_service.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel> items = [];
  var isLoading = false;

  void apiUserList() async {
    setState(() {
      isLoading = true;
    });
    var response = await ProductService.GET();
    setState(() {
      isLoading = false;
      items = ProductService.parseUsersList(response);
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
          "Products",
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
                  leading: Image.network(
                    items[index].image
                  ),
                  title: Text(
                    items[index].title,
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    items[index].description
                  ),
                  trailing: Text(
                    items[index].price.toString(),
                    style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16),
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
