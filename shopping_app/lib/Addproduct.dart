import  'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppingapp/cart.dart';
class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int id;
  String name;
  String desc;
  double price;
  String url;

  addRecordInDb() async {
    Map<String, Object> map = <String, Object>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'url': url
    };
    final DocumentReference documentReference =
    Firestore.instance.document("prods" + id.toString());
    documentReference.setData(map).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }




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
      body: ListView(children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          autofocus: true,
          onChanged: (str) => id = int.parse(str),
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(hintText: 'Type Id Here'),
        ),
        TextField(
          maxLength: 30,
          keyboardType: TextInputType.text,
          onChanged: (str) => name = str,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(hintText: 'Type Name Here'),
        ),
        TextField(
          keyboardType: TextInputType.text,
          maxLines: 5,
          maxLength: 500,
          onChanged: (str) => desc = str,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(hintText: 'Type Desc Here'),
        ),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (str) => price = double.parse(str),
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone), hintText: 'Type Price Here'),
        ),
        TextField(
          keyboardType: TextInputType.text,
          onChanged: (str) => url = str,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type URL Here',
              prefixIcon: Icon(Icons.web)),
        ),
        MaterialButton(
          color: Colors.blue,
          child: Text(
            'Add Product',
            style: TextStyle(fontSize: 20),
          ),
          elevation: 3,

          onPressed: () {

            print(
                "Id is $id NAme is $name Desc is $desc Price is $price URL is $url");
            addRecordInDb();

          },
        ),
      ]),
    );
  }
}