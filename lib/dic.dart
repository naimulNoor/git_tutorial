import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';

class DraggableBottomSheetExample extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.ac_unit,
      Icons.account_balance,
      Icons.adb,
      Icons.add_photo_alternate,
      Icons.format_line_spacing
    ];

    return Scaffold(
        body: DraggableBottomSheet(
          backgroundWidget: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
            ),
            body: Container(
              height: 400,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 32),
                itemCount: icons.length,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    icons[index],
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 10),
              ),
            ),
          ),
          previewChild: Container(
          height: 400,
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

                    Container(
                      height: 300,
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
                  ],
                ),
              ),

            ],
          ),
        ),
          expandedChild: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Hey...I\'m expanding!!!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: icons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          icons[index],
                          color: Colors.pink,
                          size: 40,
                        ),
                      )),
                )
              ],
            ),
          ),
          minExtent: 150,
          maxExtent: MediaQuery.of(context).size.height * 0.8,
        ));
  }
}
