import 'package:flutter/material.dart';
import 'package:gg/main.dart';

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
        title: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
            child: Text('Ginger Garlic')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white),
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
          ),

          //similar products section

          Divider(),
          Padding(
            padding: const EdgeInsets.all(7),
            child: new Text("Smilar Items"),
          ),

          new Container(
            height: 360,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [

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
    return GridView.builder (
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Similar_Single_product(
            product_name: product_list[index]['Name'],
            product_price: product_list[index]['Price'],
            product_picture: product_list[index]['Picture'],
          );
        }
    );
  }
}

class Similar_Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_price;

  Similar_Single_product(
      {
        this.product_name,
        this.product_picture,
        this.product_price,
      });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetails(
            product_detail_name: product_name,
            product_detail_price: product_price,
            product_detail_picture: product_picture,
          ))),
            child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: new Row(children: <Widget>[
                    Expanded(
                      child: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                    ),
                    new Text("\$${product_price}", style: TextStyle(color: Colors.red),)
                  ],)
              ),

              child: Image.asset(product_picture,
                fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}
