import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sun_save/models/object_type.dart';

class HType extends StatefulWidget {
  @override
  _HTypeState createState() => _HTypeState();
}

class _HTypeState extends State<HType> {
  var selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            InkWell(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Provider.of<ObjectType>(context, listen: false)
                              .getValue() ==
                          0
                      ? Colors.white
                      : Colors.white12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.home,
                  color: Provider.of<ObjectType>(context, listen: false)
                              .getValue() ==
                          0
                      ? Colors.black
                      : Colors.white,
                  size: 40.0,
                ),
              ),
              onTap: () {
                setState(() {
                  Provider.of<ObjectType>(context, listen: false).changeType(0);
                });
              },
            ),
            Text(
              'Ev',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
        SizedBox(width: 20.0),
        Column(
          children: [
            InkWell(
              child: Container(
                child: Icon(
                  Icons.location_city,
                  color: Provider.of<ObjectType>(context, listen: false)
                              .getValue() ==
                          1
                      ? Colors.black
                      : Colors.white,
                  size: 40.0,
                ),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Provider.of<ObjectType>(context, listen: false)
                              .getValue() ==
                          1
                      ? Colors.white
                      : Colors.white12,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onTap: () {
                setState(() {
                  Provider.of<ObjectType>(context, listen: false).changeType(1);
                });
              },
            ),
            Text(
              'Konut',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
      ],
    );
  }
}
