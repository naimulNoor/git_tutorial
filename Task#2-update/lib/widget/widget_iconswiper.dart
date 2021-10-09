import 'package:flutter/material.dart';

class IconSwiper extends StatefulWidget {
  const IconSwiper({Key key}) : super(key: key);

  @override
  _IconSwiperState createState() => _IconSwiperState();
}

class _IconSwiperState extends State<IconSwiper> {

  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: Container(
          width: 100,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 6.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
         
         child:  buttonTask(),
        ),
      ),
    );
  }

  Widget buttonTask() {
    if(selectedIndex==0){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(child: Icon(Icons.location_on)),
          InkWell(
            onTap: (){
              selectedIndex=1;
              setState(() {

              });
            },
              child: Icon(Icons.menu)),
        ],
      );
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: (){
                selectedIndex=0;
                setState(() {

                });
              },
              child: Icon(Icons.location_on)),
          CircleAvatar(child: Icon(Icons.menu)),
        ],
      );
    }
  }
}
