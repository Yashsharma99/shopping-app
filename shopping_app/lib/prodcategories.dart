import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppingapp/Cart1.dart';

class productcategory extends StatefulWidget {
  @override
  _productcategoryState createState() => _productcategoryState();
}

class _productcategoryState extends State<productcategory> {
//  Widget _buildList(){
//    return StreamBuilder<QuerySnapshot>(
//      stream: Firestore.instance.collection('').snapshots(),
//      builder: (BuildContext context ,AsyncSnapshot<QuerySnapShot>snapshot));
//       return new ListView(Child)
//    );
//  }




//  HashMap map1 = new HashMap<int, String>();
////  map1[1]=(doc['coat']);



  Widget _buildList () {
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
      leading: Icon(Icons.add_shopping_cart),
      title: new Text(doc["Name"]),
      subtitle: new Text("RS"+doc["Price"].toString()),
      trailing: MaterialButton(
          color: Colors.black,
          child: Text('Add To cart', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),



          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart1()));

          },


      ),
    )
    )
        .toList();
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Coat'),
        actions: <Widget>[
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.add_shopping_cart , color: Colors.white),
          )
        ],
      ),
      body: _buildList (),

    );
  }
}
