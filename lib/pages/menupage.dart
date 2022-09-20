import 'package:flutter/material.dart';

import '../datamodel.dart';
import 'datamanager.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dataManager.getMenu(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            //The future has finished data is ready
            var categories = snapshot.data as List<Category>;
            return Text("There are ${categories.length} categories");
          } else {
            if (snapshot.hasError) {
              //Data not available because of an error
              return const Text("There was an error loading the data");
            } else {
              //Data is in progress
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        }));
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({Key? key, required this.product, required this.onAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/black_coffee.png'),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$${product.price}"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onAdd(product);
                    },
                    child: const Text("Add"),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
