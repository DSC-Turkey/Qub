import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  var apiUrl;
  var latitude;
  var longitude;
  double value;

  Network({this.latitude, this.longitude}) {
    apiUrl =
        'https://api.sunrise-sunset.org/json?lat=$latitude&lng=$longitude&date=today';
  }

  Future<double> getSunDetails() async {
    var request = await http.get(apiUrl);
    var decodedJson = jsonDecode(request.body);
    String dayTime = decodedJson['results']['day_length'];
    int hour = int.tryParse(dayTime.substring(0, 2));
    double minute = double.tryParse(dayTime.substring(3, 5)) / 60;
    value = hour + minute;
    return value;
  }
}
