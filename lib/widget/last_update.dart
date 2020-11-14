import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastUpdate extends StatelessWidget {
   var lastUpdate;
   LastUpdate({Key key, this.lastUpdate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      "Son Güncelleme  "+TimeOfDay.fromDateTime(lastUpdate).format(context),
      style: TextStyle(fontSize: 18),
    );
  }
}
