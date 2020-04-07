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
              height: 400,
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
                                child: new Text (
                                    "\$${widget.product_detail_price}")
                            )
                          ],
                        ),
                      )
                  )
              )
          ),

          //1st Button
          Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text ("Quantity"),
                              content: new Text("Choose the Quantity"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);//close button
                              },
                              child: new Text("close"),
                              ),
                            ],
                          );
                        });
                      },
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: new Text("Quantity"),

                          ),
                          Expanded(
                              child: new Icon(Icons.arrow_drop_down)
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(context: context,
                            builder: (context) {
                              return new AlertDialog(
                                title: new Text ("Side"),
                                content: new Text("Choose the Side"),
                                actions: <Widget>[
                                  new MaterialButton(onPressed: (){
                                    Navigator.of(context).pop(context);//close button
                                  },
                                    child: new Text("close"),
                                  ),
                                ],
                              );
                            });
                      },
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.1,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: new Text("Side")
                          ),
                          Expanded(
                              child: new Icon(Icons.arrow_drop_down)
                          )
                        ],
                      ),
                    )
                ),
              ]
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0,
                  child: new Text("Buy Now"),
                ),
              ),


              new IconButton(
                  icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border), color: Colors.red, onPressed: () {}),

            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Item Details"),
            subtitle: new Text("A rich and flavourful North Indian curry with distinctive ingredients"),
          )
        ],
      ),
    );
  }
}
