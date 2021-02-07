import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sun_save/models/object_type.dart';

class ChartBar extends StatelessWidget {
  final double solarPanelType;
  ChartBar({this.solarPanelType = 1});
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        maxY: solarPanelType * 20,
        minY: 0,
        groupsSpace: 32,
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (val) => TextStyle(fontSize: 12.0),
            margin: 20,
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return 'Portatif Isıtıcı';
                case 1:
                  return 'Fırın';
                case 2:
                  return 'Bulaşık Mak.';
                case 3:
                  return 'Çamaşır Mak.';
                case 4:
                  return 'Kurutma Mak.';
                default:
                  return '';
              }
            },
          ),
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 18,
                width: 15,
                colors: [Colors.white],
              ),
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 18 -
                    Provider.of<ObjectType>(context, listen: false)
                        .getSolarPanelType(),
                width: 15,
                colors: [Colors.greenAccent],
              )
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 4.32,
                width: 15,
                colors: [Colors.white],
              ),
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 2.5,
                width: 15,
                colors: [Colors.greenAccent],
              )
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 4.6,
                width: 15,
                colors: [Colors.white],
              ),
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 4.6 -
                    Provider.of<ObjectType>(context, listen: false)
                        .getSolarPanelType(),
                width: 15,
                colors: [Colors.greenAccent],
              )
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 12.6,
                width: 15,
                colors: [Colors.white],
              ),
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 10,
                width: 15,
                colors: [Colors.greenAccent],
              )
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 8.9,
                width: 15,
                colors: [Colors.white],
              ),
              BarChartRodData(
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 20,
                  colors: [Colors.white54],
                ),
                y: 8.9 -
                    Provider.of<ObjectType>(context, listen: false)
                        .getSolarPanelType(),
                width: 15,
                colors: [Colors.greenAccent],
              )
            ],
          )
        ],
      ),
    );
  }
}
