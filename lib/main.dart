import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:gg/components/horizontal_listview.dart';
import 'package:gg/components/products.dart';


void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/1.jpeg'),
          AssetImage('images/2.jpeg'),
          AssetImage('images/3.jpeg'),
          AssetImage('images/4.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(microseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 7,
      ),

    );


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
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              //header
              new UserAccountsDrawerHeader(
                  accountName: Text('Varul Arora'),
                  accountEmail: Text('varularora@gmail.com'),
                  currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white,),
        ),

                ),
                  decoration: new BoxDecoration(
                    color: Colors.deepOrangeAccent
                  )
              ),

              //body
              InkWell(
                onTap: (){},
                child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              )
              ),
              InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('My Account'),
                    leading: Icon(Icons.person),
                  )
              ),

              InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('My Orders'),
                    leading: Icon(Icons.shopping_basket),
                  )
              ),

              InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Categories'),
                    leading: Icon(Icons.dashboard,
                  )
              )
              ),

              InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Favourites'),
                    leading: Icon(Icons.favorite),
                  ),
              ),
              Divider(),

              InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings, color: Colors.blue),
                  )
              ),

              InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.help, color: Colors.lightBlueAccent),
                  )
              )
            ],
          ),
        ),

        body: new ListView(
          children: <Widget>[
            image_carousel,
            //padding widget
            new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Ginger Garlic Menu'),),

            //Horizontal List
            HorizontalList(),

            new Padding(padding: const EdgeInsets.all(25),
            child: new Text('Hot Sells'),),

            //grid view
            Container(
              height: 300,
                child:Products(),
            )
          ],
        )
    );
  }
}
