import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hello_world/components/layout.dart';

class ChartSelectionCallbackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartSelectionCallbackState();
  }
}

class ChartSelectionCallbackState extends State<ChartSelectionCallbackPage> {
  String _selectedYear;
  int _selectedSales;
  int _count = 20;

  List<charts.Series<OrdinalSales, String>> _createSampleData2() {
    final data = [
      new OrdinalSales('2014', _count, Colors.red),
      new OrdinalSales('2015', 125, Colors.yellow),
      new OrdinalSales('2018', 75, Colors.green),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'year sales',
          colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          fillColorFn: (OrdinalSales sales, _) => sales.color,
          data: data)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Column(children: <Widget>[
      SizedBox(
        height: 400,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: charts.BarChart(
            this._createSampleData2(),
            barRendererDecorator: charts.BarLabelDecorator(
                labelPosition: charts.BarLabelPosition.outside),
            defaultInteractions: true,
            selectionModels: [
              charts.SelectionModelConfig(
                  type: charts.SelectionModelType.info,
                  changedListener: _onSelectionChange)
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          'Selected data: $_selectedYear - $_selectedSales',
          style: TextStyle(color: Colors.red),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20),
        child: Wrap(
          spacing: 10,
          children: <Widget>[
            RaisedButton(
              child: Text('increase'),
              onPressed: () {
                setState(() {
                  _count = _count + 5;
                });
              },
            ),
            RaisedButton(
              child: Text('decrease'),
              onPressed: () {
                setState(() {
                  _count = _count - 5;
                });
              },
            ),
          ],
        ),
      )
    ]));
  }

  _onSelectionChange(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    String year;
    int sales;

    if (selectedDatum.isNotEmpty) {
      year = selectedDatum.first.datum.year;
      sales = selectedDatum.first.datum.sales;
    }

    setState(() {
      _selectedYear = year;
      _selectedSales = sales;
    });
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;
  final charts.Color color;

  OrdinalSales(this.year, this.sales, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
