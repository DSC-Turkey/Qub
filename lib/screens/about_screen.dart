import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About SunSaver',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'SunSaver’in izleme platformu uygulaması şık ve kullanımı kolay bir arayüz sunarak kullanıcıya ilk olarak ev ve konut arasında seçim yaptırır ve daha sonrasında gün, hafta, ay, yıl enerji üretim görünümlerine kolayca erişme yeteneği sağlar. \nSunSaver izleme uygulamasında mevcut hava durumu, 5 günlük hava durumu ve gerçek zamanlı güç üretiminin kW bazında karşılığı gibi temel ayrıntıları yakalar.',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}
