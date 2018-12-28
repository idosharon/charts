import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

        ),
        body: Makjax(),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.menu), onPressed: () {},),
              IconButton(icon: Icon(Icons.search), onPressed: () {},),
            ],
          ),
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.show_chart), ),
      ),
    );
  }
}

class Makjax extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var data = [
      Sales("Sun",15),
      Sales("Mon", 12),
      Sales("Tus",50),
      Sales("Wed", 34),
      Sales("The",21),
      Sales("Sat", 8),

    ];

    var series = [
      charts.Series(
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (Sales sales,_)=> sales.day,
          measureFn: (Sales sales,_)=> sales.sold,
          id: "Sales",
          data: data
      )
    ];

    var chart = charts.BarChart(
      series,
    );

    var chart2 = charts.LineChart(
      series
    );

    return Center(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              child: chart2,
            )
          ],
        ),
      ),
    );
  }
}

class Sales {
  final String day;
  final int sold;

  Sales(this.day,this.sold);
}