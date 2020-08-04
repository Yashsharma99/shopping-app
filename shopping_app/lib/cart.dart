import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Widget _getAll() {

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('prods').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return new ListView(children: getProduct(snapshot));
      },
    );
  }

  getProduct(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) => new ListTile(
        title: new Text(doc["name"]),
        subtitle: new Text(doc["price"].toString())))
        .toList();
  }
//  Widget _getAll0() {
//
//    return StreamBuilder<QuerySnapshot>(
//      stream: Firestore.instance.collection('jeans').snapshots(),
//      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//        return new ListView(children: getProduct1(snapshot));
//      },
//    );
//  }
//
//  getProduct1(AsyncSnapshot<QuerySnapshot> snapshot) {
//    return snapshot.data.documents
//        .map((doc) => new ListTile(
//        title: new Text(doc["Name"]),
//        subtitle: new Text(doc["Price"].toString())))
//        .toList();
//  }

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
            body: _getAll(),

    );

  }
}


