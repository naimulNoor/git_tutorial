import 'package:flutter/material.dart';
import 'package:untitled/widget/widget_iconswiper.dart';

import 'item_vehicle.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("48 Vehilcles"),
        leading: Icon(Icons.navigate_before),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [

          Column(
            children: [
              SearchBar(),
              VehilclesList(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconSwiper(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.account_tree,color: Colors.black,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SearchBar() {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.grey,width: 2)
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_sharp),
            border: InputBorder.none,
          hintText: "search by OR,IMEI"
        ),
      ),
    );
  }

  Widget VehilclesList() {
    return Container(
      child: Expanded(
          child: VehicleItems())
    ) ;
  }
}
