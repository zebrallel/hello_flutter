---
theme: 'Moon'
controls: false
transition: 'slide'
enableTitleFooter: false
---

# conception

- Domain:  The thing being measured; e.g. "type of vehicle"
- Measure: The numerical value; e.g. "number of wheels"
- Data point: A measure for a domain; e.g. ('car', 4)
- Series: A sequenced collection of individual data points; e.g. [('car', 4), ('bicycle', 2)]
- Id: A unique identifier for a single series

---

## Series sample

```dart
var series = [
  new charts.Series(
    id: 'Clicks',
    domainFn: (ClicksPerYear clickData, _) => clickData.year,
    measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
    colorFn: (ClicksPerYear clickData, _) => clickData.color,
    data: data,
  ),
];
class ClicksPerYear {
  String year;
  int clicks;
  Color color;

  ClicksPerYear({this.year, this.clicks, this.color});
}
```

---