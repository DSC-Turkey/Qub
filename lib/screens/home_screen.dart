import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sun_save/models/object_type.dart';
import 'package:sun_save/models/tip.dart';
import 'package:sun_save/services/network.dart';
import 'package:sun_save/widgets/type.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  Position currentPosition;
  double sunDetails = 1;
  double value = 1;

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    Network network = Network(
        latitude: position.latitude.toInt(),
        longitude: position.longitude.toInt());
    sunDetails = await network.getSunDetails();

    setState(() {});
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
    currentPosition = await Geolocator.getCurrentPosition();

    return await Geolocator.getCurrentPosition();
  }

  List months = [
    'Ocak',
    'Şubat',
    'Mart',
    'Nisan',
    'Mayıs',
    'Haziran',
    'Temmus',
    'Ağustos',
    'Eylül',
    'Ekim',
    'Kasım',
    'Aralık'
  ];

  List<Tip> tips = [
    Tip(
      title: 'Ipucu',
      content: "Elektrikli eşyaları kullanmıyorken kapatabilirsiniz.",
    ),
    Tip(
      title: 'Ipucu',
      content: 'Işıkları gece açık tutmak yerine gece lambası alabilirsiniz.',
    ),
    Tip(
      title: 'Ipucu',
      content: 'Telefonunuzun şarjı dolduğunda şarjdan çıkartabilirsiniz.',
    ),
    Tip(
      title: 'Ipucu',
      content:
          'Bunlara uymak hem doğaya yardımcı olucak hem de paranızı cebinizde tutmanızı sağlayacak.',
    ),
    Tip(
      title: 'Ipucu',
      content: 'Güneşi kullanmak tamamen bedava!',
    ),
    Tip(
      title: 'Ipucu',
      content:
          'Hakkımızda daha fazla şey öğrenmek için hakkında sayfasına bakabilirsiniz.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _determinePosition();
    getLocation();
    // calcTotal();
  }

  DateTime now = new DateTime.now();
  final _chartSize = const Size(300.0, 300.0);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: Column(
          children: [
            HType(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                // initialValue: '0',
                keyboardType: TextInputType.number,
                onChanged: (newValue) {
                  if (newValue.length < 1) {
                    Provider.of<ObjectType>(context, listen: false)
                        .setAmount(0);
                  }
                  setState(() {
                    Provider.of<ObjectType>(context, listen: false)
                        .setSolarPanelType(double.parse(newValue));
                  });
                },
                decoration: InputDecoration(
                    filled: true,
                    hintText:
                        'Kullandığınız güneş panelini kW cinsinden yazınız',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
            ),
            Text('${now.day} ${months[now.month - 1]}',
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            AnimatedCircularChart(
              duration: Duration(
                milliseconds: 800,
              ),
              size: _chartSize,
              initialChartData: <CircularStackEntry>[
                new CircularStackEntry(
                  <CircularSegmentEntry>[
                    new CircularSegmentEntry(
                      Provider.of<ObjectType>(context, listen: false)
                          .getAmount(),
                      Colors.white,
                      rankKey: 'completed',
                    ),
                    new CircularSegmentEntry(
                      66.67,
                      Colors.white24,
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
              ],
              edgeStyle: SegmentEdgeStyle.round,
              holeRadius: 100,
              holeLabel:
                  'Kazanılan \n${Provider.of<ObjectType>(context, listen: false).getAmount()} TL',
              labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(height: 50.0),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(height: 150.0),
                items: tips.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                i.getTitle(),
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                i.getContent(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
