import 'package:flutter/material.dart';
import 'package:gg/pages/product_details.dart';



class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
          return Single_product(
            product_name: product_list[index]['Name'],
            product_price: product_list[index]['Price'],
            product_picture: product_list[index]['Picture'],
          );
      }
    );
  }
}

class Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_price;

  Single_product(
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
