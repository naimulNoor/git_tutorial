import 'package:badges/badges.dart';
import 'package:flutter/material.dart';


class WidgetIconBadge extends StatefulWidget {
  String count="0";
  IconData icon=Icons.access_alarm;
  Color badgeColor=Colors.red;
  Color textColor=Colors.blue;
  VoidCallback onTap;
  WidgetIconBadge({
    this.count,
    this.textColor,
    this.icon,
    this.badgeColor,
    this.onTap

});

  @override
  _WidgetIconBadgeState createState() => _WidgetIconBadgeState();
}

class _WidgetIconBadgeState extends State<WidgetIconBadge> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Badge(
          badgeContent: Text(widget.count,style:TextStyle(color:widget.textColor)),
          child: Icon(widget.icon),
          badgeColor: widget.badgeColor,


        )
    );
  }
}


