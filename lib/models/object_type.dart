import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sun_save/services/network.dart';

class ObjectType extends ChangeNotifier {
  int home = 0;
  double _solarPanelType = 1;
  double profit;
  double sunDetails = 0;

  ObjectType() {
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    Network network = Network(
        latitude: position.latitude.toInt(),
        longitude: position.longitude.toInt());
    sunDetails = await network.getSunDetails();
  }

  void changeType(int value) {
    home = value;
    notifyListeners();
  }

  int getValue() => home;

  double dailyWatt() => sunDetails * 0.75 * _solarPanelType;

  double calcTotal() {
    if (getValue() == 0) {
      profit = dailyWatt() * 0.6092;
    } else {
      profit = dailyWatt() * 0.8062;
    }
    return profit;
  }

  double getSolarPanelType() => _solarPanelType;

  void setAmount(double d) {
    profit = d;
    sunDetails = d;
    notifyListeners();
  }

  double getAmount() {
    return calcTotal();
  }

  void setSolarPanelType(double s) {
    _solarPanelType = s;
    notifyListeners();
  }
}
