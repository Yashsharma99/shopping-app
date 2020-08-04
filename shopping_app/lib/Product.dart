import 'package:flutter/material.dart';

import 'package:shoppingapp/item.dart';
import 'package:shoppingapp/productdetail.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Item> itemList = [];
  _loadItems() {
    itemList = [
      Item(1001, "Winter Wear", "Winter", 10000,
          "http://www.totalopt.com/imgs/main/Suit-Spring-Retro-New-Coat-Long-Section-Checks-Gray-Leisure-Red-Women-s-England-Violet-Maize-2214.png"),
      Item(1002, "Coat", "Coats", 15000,
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeUp5Co-2itcV1yjTzrvdbTXk5gSsxl2b6dfEO7hdbrpn7id-G"),
      Item(1003, "Leather Jacket", "Leather", 7999,
          "https://www.stickpng.com/assets/images/5a68f3aa01d15068bdfe87d5.png"),
      Item(1004, "Fashion", "Fashion", 10000,
          "https://www.mdc.edu/fashion/img/fashion-forward-model.png")
    ];
  }

  _printSingleItem(Item item) {
    return Container(
      child: Card(
        child: Hero(
          tag: item.name,
          child: Material(
            child: InkWell(
              onTap: () {
                return Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProductDetail(item.name, item.url, item.price);
                }));
              },
              child: GridTile(
                child: Image.network(
                  item.url,
                  fit: BoxFit.cover,
                ),
                footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      title: Text("Rs " + item.price.toString()),
                      leading: Text(
                        item.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _loadItems();
    return Container(
      height: 920,
      child: GridView.builder(
          itemCount: itemList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, int index) {
            return _printSingleItem(itemList[index]);
          }),
    );
  }
}