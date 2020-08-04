import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppingapp/cart.dart';
class Cart1 extends StatefulWidget {
  @override
  _Cart1State createState() => _Cart1State();
}

class _Cart1State extends State<Cart1> {
  Widget _getAll0() {

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('coat').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        return new ListView(children: getProduct(snapshot));
      },
    );
  }

  getProduct(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents

        .map((doc) => new ListTile(
        title: new Text(doc["Name"]),
        subtitle: new Text(doc["Price"].toString())))
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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));

            },
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
          )
        ],
      ),
      body: _getAll0(),

    );

  }
}


