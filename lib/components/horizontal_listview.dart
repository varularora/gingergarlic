import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/kebab.jpeg',
            image_caption: 'Kebab & Tandoor',
          ),

          Category(
            image_location: 'images/sandwich.jpeg',
            image_caption: 'Sandwich',
          ),

          Category(
            image_location: 'images/rice.jpeg',
            image_caption: 'Rice',
          ),

          Category(
            image_location: 'images/dips.jpeg',
            image_caption: 'Dips',
          ),

          Category(
            image_location: 'images/drink.jpeg',
            image_caption: 'Drinks',
          ),
      ]
      )
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2),
    child: InkWell(onTap: (){},
    child: Container(
      width: 100.0,
      child: ListTile(
        title: Image.asset(image_location, width: 70.0, height:80.0,),
        subtitle: Container
          (alignment: Alignment.topCenter,
        child: Text(image_caption)),
      ),
    )
    ));
  }
}

