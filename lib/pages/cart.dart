import 'package:flutter/material.dart';
import 'package:gg/components/cart_product.dart';
import 'package:gg/components/cart_product.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text('Shopping Cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {}),

        ],
      ),

      body: new cart_product(),
      
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child:  ListTile(
                title: new Text("Total Amount:"),
                subtitle: new Text("\£250"),
              )
            ),
            
            Expanded(
              child: new MaterialButton(onPressed: (){},
              child: new Text("Check Out", style: TextStyle(color: Colors.white)),
              color: Colors.red,),
            )
            
          ],
        )
      ),
      
    );
  }
}


