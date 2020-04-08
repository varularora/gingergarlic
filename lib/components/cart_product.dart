import 'package:flutter/material.dart';

class cart_product extends StatefulWidget {
  @override
  _cart_productState createState() => _cart_productState();
}

class _cart_productState extends State<cart_product> {
  var product_on_cart =
  [

  {
  "Name":"Afghani Chicken",
  "Picture":"images/Afghani_chicken.jpg",
  "Price":"9",
  },
  {
  "Name":"Rajama Masala",
  "Picture":"images/Rajama_Masala.jpg",
  "Price":"9",
  },
  {
  "Name":"Saag Aloo",
  "Picture":"images/Saag_Aloo.jpg",
  "Price":"9",
  },
  {
  "Name":"Red Chicken",
  "Picture":"images/Red_Chicken.jpg",
  "Price":"9",
  },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product_on_cart.length,
      itemBuilder: (context, index) {
        return single_cart_product(
          cart_product_name: product_on_cart[index]["Name"],
          cart_product_picture: product_on_cart[index]["picture"],
          cart_product_price: product_on_cart[index]["price"],

        );
      }
    );
  }
}

class single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;

  single_cart_product({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text (cart_product_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: Text ("Quantity : "),),

                Text("Side : "),

                //price
              new Container(
                alignment: Alignment.topLeft,
                child: Text("\$${cart_product_price}")

                )


              ],
            )
          ],
        ),
      )
    );
  }
}

