import 'package:flutter/material.dart';
import 'package:shoppingapp/prodcategories.dart';//coat
import 'package:shoppingapp/category1.dart';//jeans
import 'package:shoppingapp/category2.dart';//T-shirt
import 'package:shoppingapp/Category3.dart';//Tie
class Categories extends StatelessWidget {
  Widget _buildSingleCategory(imageName, caption,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>productcategory()));
        },
        child: Container(
            width: 100,
            child: ListTile(
              title: Image.asset(imageName),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  caption,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            )),
      ),
    );
  }
  Widget _buildSingleCategory1(imageName, caption,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>productsinCategory1()));
        },
        child: Container(
            width: 100,
            child: ListTile(
              title: Image.asset(imageName),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  caption,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            )),
      ),
    );
  }
  Widget _buildSingleCategory2(imageName, caption,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>productsinCategory2()));
        },
        child: Container(
            width: 100,
            child: ListTile(
              title: Image.asset(imageName),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  caption,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildSingleCategory3(imageName, caption,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>productcategory()));
        },
        child: Container(
            width: 100,
            child: ListTile(
              title: Image.asset(imageName),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  caption,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildSingleCategory4(imageName, caption,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>productcategory()));
        },
        child: Container(
            width: 100,
            child: ListTile(
              title: Image.asset(imageName),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  caption,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            )),
      ),
    );
  }
  Widget _buildSingleCategory5(imageName, caption,BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>productcategory()));
        },
        child: Container(
            width: 100,
            child: ListTile(
              title: Image.asset(imageName),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  caption,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            )),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          _buildSingleCategory('assets/image/c1.jpg', 'Coat',context),
          _buildSingleCategory1('assets/image/j1.jpg', 'Jeans',context),
          _buildSingleCategory2('assets/image/ts1.jpg', 'TShirt',context),
          _buildSingleCategory3('assets/image/tie1.jpg', 'Tie',context),
          _buildSingleCategory4('assets/image/ht1.jpg', 'Hat',context),
          _buildSingleCategory5('assets/image/tr1.jpg', 'Trouser',context),
//          InkWell(
//            onTap: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>coat()));
//
//            },
//            child: _buildSingleCategory('assets/image/c1.jpg', 'Coat'),
//

        ],
      )
    );
  }
}