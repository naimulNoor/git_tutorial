import 'package:flutter/material.dart';
import 'package:untitled/widget/widget_iconbadge.dart';

import 'content_page.dart';


class MainPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> with TickerProviderStateMixin<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  shape: BoxShape.circle,
                  color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner, size: 30,color: Colors.grey,),
                  SizedBox(height: 5,),
                  new Text('Scan',style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(10.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ],
    ),
        child: BottomNavigationBar(
          elevation: 30,
          currentIndex: 0, // this will be set when a new tab is tapped
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),

            BottomNavigationBarItem(
                icon: WidgetIconBadge(
                  count: "3",
                  icon: Icons.check,
                  badgeColor: Colors.red,
                  textColor: Colors.white,
                ),
                title: Text('Tasks')
            )
          ],
        ),
      ),
      body: ContentPage(),
    );
  }
}