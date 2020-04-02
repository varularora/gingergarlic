import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_price,
    this.product_detail_picture,
});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
      backgroundColor: Colors.red,
      title: Text('Ginger Garlic'),
      actions: <Widget>[
        new IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {}),
        new IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {}),
      ],
    ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
                child: Container(
                    color: Colors.white70,
                        child: Image.asset(widget.product_detail_picture)),

              footer: new Container(
                color: Colors.white,
                child: ListTile(
                  leading: new Text(widget.product_detail_name),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text ("\$${widget.product_detail_price}")
                      )
                    ],
                  ),
                )
              )
                )
          )
        ],
      )
    );
  }
}
