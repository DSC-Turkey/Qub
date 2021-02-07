import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sun_save/models/object_type.dart';
import 'package:sun_save/services/network.dart';
import 'package:sun_save/widgets/chart_bar.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int type = 1;
  double sunDetails;

  void sunTime() async {
    Position position = await Geolocator.getCurrentPosition();
    Network network = Network(
        latitude: position.latitude.toInt(),
        longitude: position.longitude.toInt());

    sunDetails = await network.getSunDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0, 20.0),
            child: Text(
              'İstatistikler',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: ChartBar(
              solarPanelType: Provider.of<ObjectType>(context, listen: false)
                  .getSolarPanelType(),
            ),
          ),
          Text('Green Bars')
        ],
      ),
    );
  }
}
