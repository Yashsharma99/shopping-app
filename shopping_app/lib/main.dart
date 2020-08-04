import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:shoppingapp/Categories.dart';
import 'package:shoppingapp/Product.dart';
import 'package:shoppingapp/cart.dart';
import 'package:shoppingapp/Addproduct.dart';
void main() {
  runApp(MaterialApp(
    title: 'Shopping App - 2019',
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildCarosual() {
    return Container(
        height: 300,
        child: Carousel(
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          boxFit: BoxFit.cover,
          indicatorBgPadding: 0.2,
          dotColor: Colors.teal,
          dotSize: 7,
          images: [
            AssetImage('assets/image/p1.jpg'),
            AssetImage('assets/image/p2.jpg'),
            AssetImage('assets/image/p4.png'),
            AssetImage('assets/image/p5.jpg'),
          ],
        ));
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
              print("Cart Call");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
            },
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
          )
        ],
      ),
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              accountEmail: Text('ansh99sh@gmail.com'),
              accountName: Text('Ansh'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  backgroundColor: Colors.green,
                ),
              ),
            ),
            InkWell(




              onTap: () {},
              child: ListTile(
                title: Text('Home'),
                leading: Icon(
                  Icons.home,
                  color: Colors.teal,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
              },
              child: ListTile(
                title: Text('Add Product'),
                leading: Icon(
                  Icons.add,
                  color: Colors.teal,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.teal,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Account'),
                leading: Icon(
                  Icons.account_box,
                  color: Colors.teal,
                ),
              ),
            ),
            Divider(
              color: Colors.teal,
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.teal,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.person,
                  color: Colors.teal,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildCarosual(),

          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            )
          ),
             Categories(),
          // Adding Popular Products
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Popular Products',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
          Product()
        ],
      ),
    );
  }
}