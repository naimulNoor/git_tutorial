import 'package:flutter/material.dart';
import 'package:untitled/widget/widget_iconbadge.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'content_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin<HomePage> {
  int _currentIndex = 0;
  double firstSlotHeight=350.0;
  int swipState=0;
  bool stateOne=false;
  bool stateTwo=false;
  bool stateThree=false;

  DragStartDetails startVerticalDragDetails;
  DragUpdateDetails updateVerticalDragDetails;
  double sheetheight;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
     key: scaffoldKey,
      body:SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             FloatingActionButton(child: Icon(Icons.settings),onPressed: (){
               _showModelSheet(scaffoldKey);
             },),
             FloatingActionButton(child: Icon(Icons.my_location),)
           ],
         ),
        ),
      ) ,

    );
  }

  void _showModelSheet(GlobalKey<ScaffoldState> scaffoldKey) {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStatetwo ) {

              if(swipState==0){
                sheetheight=MediaQuery.of(context).size.height*0.36;
                stateThree=false;
                stateTwo=false;
                stateOne=true;
              }else if (swipState==1){
                stateTwo=false;
                stateOne=true;
                stateThree=true;
                sheetheight=MediaQuery.of(context).size.height*0.60;
              }else{
                sheetheight=MediaQuery.of(context).size.height*0.90;
                stateTwo=true;
                stateOne=true;
                stateThree=true;
              }
              return GestureDetector(
                onVerticalDragStart: (dragDetails) {
                  startVerticalDragDetails = dragDetails;
                },
                onVerticalDragUpdate: (dragDetails) {
                  updateVerticalDragDetails = dragDetails;
                },
                onVerticalDragEnd: (endDetails) {
                  double dx = updateVerticalDragDetails.globalPosition.dx -
                      startVerticalDragDetails.globalPosition.dx;
                  double dy = updateVerticalDragDetails.globalPosition.dy -
                      startVerticalDragDetails.globalPosition.dy;
                  double velocity = endDetails.primaryVelocity;

//Convert values to be positive
                  if (dx < 0) dx = -dx;
                  if (dy < 0) dy = -dy;



                  if (velocity < 0) {
                    print("swipe up");

                      if(swipState==0){
                        swipState=1;
                        setStatetwo(() {});
                      }
                      else if(swipState==1){
                        swipState=2;
                        setStatetwo(() {});
                      }else{
                        swipState=0;
                        Navigator.pop(context);
                      }

                    print("swipe state ${swipState}");


                  } else {
                    swipState=0;
                    Navigator.pop(context);
                  }

                },
                child: Container(
                  height: sheetheight,
                  decoration: new BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),

                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.settings, color: Colors.black),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.my_location, color: Colors.black,),),
                          ),
                        ],
                      ),

                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(25.0),
                              height: 6,
                              width: 30,
                              decoration: new BoxDecoration(
                                color: Colors.grey,
                                borderRadius: new BorderRadius.all(
                                    Radius.circular(25.0)),
                              ),

                            ),



//third stage
                            Visibility(
                              visible: stateThree,
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Location Reserved ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                                                Chip(
                                                  label: Text("INFO"),
                                                  backgroundColor: Colors.deepOrangeAccent,
                                                  avatar: Icon(Icons.info_outline,color: Colors.white,),
                                                )
                                              ],
                                            ),
                                            Text("Niketon Gulshan 1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                            Text("0.5 KM away",style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),)

                                          ],
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.blueAccent,
                                          radius: 35.0,
                                          child: Container(
                                            child:  CircularPercentIndicator(
                                              radius: 60.0,
                                              lineWidth: 5.0,
                                              percent: 0.7,
                                              center: new Text("98",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400),),
                                              progressColor: Colors.white,
                                              backgroundColor: Colors.blueAccent,
                                              circularStrokeCap: CircularStrokeCap.round,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text("Parking Slot left"),
                                      subtitle: Container(
                                        height: 10,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: Colors.green
                                        ),

                                      ),
                                      trailing: Text("5/20"),
                                    )

                                  ],
                                ),
                              ),
                            ),

//second stage
                            Visibility(
                              visible: stateTwo,
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on_outlined),
                                          SizedBox(width: 10,),
                                          Text("Niketon Gulshan Gate 2,Police Plaza"),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Text("Direction"),
                                              SizedBox(width: 10,),
                                              Image.asset("assets/images/Path.png",height: 25.0,width: 25.0,),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text("View Map"),
                                              SizedBox(width: 10,),
                                              Icon(Icons.location_on,size: 30.0,)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/file.png",height: 30.0,width: 30.0,),
                                          SizedBox(width: 10,),
                                          Text("Niketon Gulshan Gate 2,Police Plaza"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.camera),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 137,
                                              width: 242,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Gull_portrait_ca_usa.jpg/300px-Gull_portrait_ca_usa.jpg")
                                                  )
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 137,
                                              width: 242,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Gull_portrait_ca_usa.jpg/300px-Gull_portrait_ca_usa.jpg")
                                                  )
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),



//first stage
                            Visibility(
                              visible: stateOne,
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                decoration: new BoxDecoration(
                                  color: Colors.green,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("14:50s", style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 40,
                                                  color: Colors.white),),
                                              SizedBox(height: 10,),
                                              Text("Reservation time left",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17,
                                                    color: Colors.white),),
                                            ],
                                          ),
                                          Icon(Icons.watch_later,
                                            color: Colors.white.withOpacity(0.5),
                                            size: 70.0,)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: TextButton(
                                                child: Text(
                                                    "CANCEL".toUpperCase(),
                                                    style: TextStyle(fontSize: 14)
                                                ),
                                                style: ButtonStyle(
                                                    padding: MaterialStateProperty.all<
                                                        EdgeInsets>(EdgeInsets.all(15)),
                                                    backgroundColor: MaterialStateProperty
                                                        .all<Color>(Colors.white),
                                                    shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(30.0),
                                                        )
                                                    )
                                                ),
                                                onPressed: () => null
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: TextButton(
                                                child: Text(
                                                    "CANCEL".toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 14, color: Colors.white)
                                                ),
                                                style: ButtonStyle(

                                                    padding: MaterialStateProperty.all<
                                                        EdgeInsets>(EdgeInsets.all(15)),
                                                    backgroundColor: MaterialStateProperty
                                                        .all<Color>(Colors.black),
                                                    shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(30.0),
                                                        )
                                                    )
                                                ),
                                                onPressed: () => null
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              );
            });
          },

    );

  }
}


