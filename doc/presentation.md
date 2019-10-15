---
theme: 'Moon'
controls: false
transition: 'slide'
enableTitleFooter: false
---

# conception

- Domain
- Measure
- Data point
- Series
- Tick
- Legend
- Behavior

---

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

## domain axis & measure axis

* domainAxis
* primaryMeasureAxis
* secondaryMeasureAxis

---

## OrdinalAxisSpec

- viewport
- renderSpec
  - GridLineRendererSpec
  - SmallTickRendererSpec
  - NoneRenderSpec
- scaleSpec
  - SimpleOrdinalScaleSpec
  - FixedPixelSpaceOrdinalScaleSpec
  - FixedPixelOrdinalScaleSpec
- tickProviderSpec
  - BasicOrdinalTickProviderSpec
  - StaticOrdinalTickProviderSpec
- tickFormatterSpec
- showAxisLine

---

## NumericAxisSpec