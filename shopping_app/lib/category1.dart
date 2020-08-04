import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppingapp/cart.dart';

class productsinCategory1 extends StatefulWidget {
  @override
//  final String appBarkey;
//  productsinCategory1({Key key, this.appBarkey}) : super(key: key);

  _productsinCategory1State createState() => _productsinCategory1State();
}

class _productsinCategory1State extends State<productsinCategory1> {

  int id;
  String Name;
  String Desc;
  double Price;

  addRecordInDb() async {
  Map<String, Object> map = <String, Object>{
      'id' :  id,
      'name': Name,
        'desc': Desc,
        'price': Price,
   };
//    map Map.from() = LinkedHashMap<K, V>.from;







    final DocumentReference documentReference =
    Firestore.instance.document("Categories/" + id.toString());
    documentReference.setData(map).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }



  Widget _buildList () {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('jeans').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return new ListView(children: getProduct(snapshot));
      },
    );
  }
  getProduct(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) {
      return new ListTile(
        leading: Icon(Icons.add_shopping_cart),
        title: new Text(doc["Name"]),
        subtitle: new Text("RS"+doc["Price"].toString()),
        trailing: MaterialButton(
            color: Colors.black,
            child: Text('Add To cart', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),



            onPressed: () {
              addRecordInDb();
            }


        ),

      );
    }
    )
        .toList();
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Jeans'),
        actions: <Widget>[
          IconButton(
            onPressed: () {

            },
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

      body: _buildList(),





    );

  }

}