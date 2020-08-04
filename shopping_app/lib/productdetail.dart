import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  String name;
  String url;
  double price;
  ProductDetail(this.name, this.url, this.price);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Shop App-2019'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 400,
            color: Colors.black,
            child: Card(
                child: Column(
                  children: <Widget>[Image.network(widget.url)],
                )),
          )
        ],
      ),
    );
  }
}
