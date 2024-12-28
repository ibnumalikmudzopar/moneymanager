import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.people)),
          title: TextButton(onPressed: (){}, child: Text('John Legend')),
          actions: <Widget> [
            IconButton(onPressed: (){}, icon: Icon(Icons.settings), tooltip: 'Setting',),
            IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode), tooltip: 'Dark Mode',),
          ],
        ),
        body: Stack(
          children: [

          ],
        ),
      ),
      
    );
  }
}