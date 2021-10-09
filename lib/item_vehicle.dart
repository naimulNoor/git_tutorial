import 'package:flutter/material.dart';

class VehicleItems extends StatefulWidget {
  const VehicleItems({Key key}) : super(key: key);

  @override
  _VehicleItemsState createState() => _VehicleItemsState();
}

class _VehicleItemsState extends State<VehicleItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,i){
            return ItemView("#3562","2%","1 min","Active",Colors.green);
        }),
      ),
    );
  }

  Widget ItemView(String id,String batteryData,String time,String status,Color statusColor) {
    return Container(
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: true,),
              Text(id),
            ],
          ),

          Row(
            children: [
              Icon(Icons.account_circle),
              SizedBox(width: 5),
              Text(batteryData,style:TextStyle(color: Colors.grey))
              
            ],
          ),
          Row(
            children: [
              Icon(Icons.wifi),
              SizedBox(width: 5),
              Text(time,style:TextStyle(color: Colors.grey))

            ],
          ),
          Text(status,style: TextStyle(color: statusColor,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
